@[Link(ldflags: "-L/opt/homebrew/opt/llvm/lib/ -lomp")]
lib LibOmp
  KMP_VERSION_MAJOR = 5;
  KMP_VERSION_MINOR = 0;
  KMP_VERSION_BUILD = 20140926;
  KMP_BUILD_DATE    = "No_Timestamp";

  UINTPTR_MAX = 0xffffffffffffffff_u64;
  UINT64_MAX = UInt64::MAX;

  # schedule kind constants
  enum OMP_SCHED_T : Int64
    OMP_SCHED_STATIC    = 1;
    OMP_SCHED_DYNAMIC   = 2;
    OMP_SCHED_GUIDED    = 3;
    OMP_SCHED_AUTO      = 4;
    OMP_SCHED_MONOTONIC = 0x80000000;
  end

  # set API functions
  fun omp_set_num_threads       (LibC::Int) : Void;
  fun omp_set_dynamic           (LibC::Int) : Void;
  fun omp_set_nested            (LibC::Int) : Void;
  fun omp_set_max_active_levels (LibC::Int) : Void;
  fun omp_set_schedule          (OMP_SCHED_T, LibC::Int) : Void;

  # query API functions
  fun omp_get_num_threads  : LibC::Int;
  fun omp_get_dynamic      : LibC::Int;
  fun omp_get_nested       : LibC::Int;
  fun omp_get_max_threads  : LibC::Int;
  fun omp_get_thread_num   : LibC::Int;
  fun omp_get_num_procs    : LibC::Int;
  fun omp_in_parallel      : LibC::Int;
  fun omp_in_final         : LibC::Int;
  fun omp_get_active_level : LibC::Int;
  fun omp_get_level        : LibC::Int;
  fun omp_get_ancestor_thread_num (LibC::Int) : LibC::Int;
  fun omp_get_team_size (LibC::Int) : LibC::Int;
  fun omp_get_thread_limit : LibC::Int;
  fun omp_get_max_active_levels : LibC::Int;
  fun omp_get_schedule (OMP_SCHED_T*, LibC::Int*) : Void;
  fun omp_get_max_task_priority : Void;

  # lock API functions
  struct OMP_LOCK_T
    _lk : Void*;
  end

  fun omp_init_lock    (OMP_LOCK_T*) : Void;
  fun omp_set_lock     (OMP_LOCK_T*) : Void;
  fun omp_unset_lock   (OMP_LOCK_T*) : Void;
  fun omp_destroy_lock (OMP_LOCK_T*) : Void;
  fun omp_test_lock    (OMP_LOCK_T*) : LibC::Int;

  # nested lock API functions
  struct OMP_NEST_LOCK_T
    _lk : Void*;
  end

  fun omp_init_nest_lock    (OMP_NEST_LOCK_T*) : Void;
  fun omp_set_nest_lock     (OMP_NEST_LOCK_T*) : Void;
  fun omp_unset_nest_lock   (OMP_NEST_LOCK_T*) : Void;
  fun omp_destroy_nest_lock (OMP_NEST_LOCK_T*) : Void;
  fun omp_test_nest_lock    (OMP_NEST_LOCK_T*) : LibC::Int;

  # OpenMP 5.0 Synchronization hints
  enum OMP_SYNC_HINT_T
    OMP_SYNC_HINT_NONE            = 0;
    OMP_LOCK_HINT_NONE            = OMP_SYNC_HINT_NONE;
    OMP_SYNC_HINT_UNCONTENDED     = 1;
    OMP_LOCK_HINT_UNCONTENDED     = OMP_SYNC_HINT_UNCONTENDED;
    OMP_SYNC_HINT_CONTENDED       = 1 << 1;
    OMP_LOCK_HINT_CONTENDED       = OMP_SYNC_HINT_CONTENDED;
    OMP_SYNC_HINT_NONSPECULATIVE  = 1 << 2;
    OMP_LOCK_HINT_NONSPECULATIVE  = OMP_SYNC_HINT_NONSPECULATIVE;
    OMP_SYNC_HINT_SPECULATIVE     = 1 << 3;
    OMP_LOCK_HINT_SPECULATIVE     = OMP_SYNC_HINT_SPECULATIVE;
    KMP_LOCK_HINT_HLE             = 1 << 16;
    KMP_LOCK_HINT_RTM             = 1 << 17;
    KMP_LOCK_HINT_ADAPTIVE        = 1 << 18;
  end

  # lock hint type for dynamic user lock
  type OMP_LOCK_HINT_T = OMP_SYNC_HINT_T;

  # hinted lock initializers
  fun omp_init_lock_with_hint      (OMP_LOCK_T*, OMP_LOCK_HINT_T) : Void;
  fun omp_init_nest_lock_with_hint (OMP_NEST_LOCK_T*, OMP_LOCK_HINT_T) : Void;

  # time API functions
  fun omp_get_wtime : LibC::Double;
  fun omp_get_wtick : LibC::Double;

  # OpenMP 4.0
  fun omp_get_default_device : LibC::Int;
  fun omp_set_default_device  (LibC::Int) : Void;
  fun omp_is_initial_device  : LibC::Int;
  fun omp_get_num_devices    : LibC::Int;
  fun omp_get_num_teams      : LibC::Int;
  fun omp_get_team_num       : LibC::Int;
  fun omp_get_cancellation   : LibC::Int;

  # OpenMP 4.5
  fun omp_get_initial_device : LibC::Int;
  fun omp_target_alloc (LibC::SizeT, LibC::Int) : Void*;
  fun omp_target_free (Void*, LibC::Int) : Void;
  fun omp_target_is_present (Void*, LibC::Int) : LibC::Int;
  fun omp_target_memcpy (Void*, Void*, LibC::SizeT, LibC::SizeT, LibC::SizeT, LibC::Int, LibC::Int) : LibC::Int;
  fun omp_target_memcpy_rect (Void*, Void*, LibC::SizeT, LibC::Int, LibC::SizeT*, LibC::SizeT*, LibC::SizeT*, LibC::SizeT*, LibC::SizeT*, LibC::Int, LibC::Int) : LibC::Int;
  fun omp_target_associate_ptr (Void*, Void*, LibC::SizeT, LibC::SizeT, LibC::Int) : LibC::Int;
  fun omp_target_disassociate_ptr (Void*, LibC::Int) : LibC::Int;

  # OpenMP 5.0
  fun omp_get_device_num : LibC::Int;
  type OMP_DEPEND_T = Void*;

  # OpenMP 5.1 interop
  type OMP_INTPTR_T = LibC::Long;

  # 0..omp_get_num_interop_properties()-1 are reserved for implementation-defined properties
  enum OMP_INTEROP_PROPERTY
    OMP_IPR_FR_ID          = -1;
    OMP_IPR_FR_NAME        = -2;
    OMP_IPR_VENDOR         = -3;
    OMP_IPR_VENDOR_NAME    = -4;
    OMP_IPR_DEVICE_NUM     = -5;
    OMP_IPR_PLATFORM       = -6;
    OMP_IPR_DEVICE         = -7;
    OMP_IPR_DEVICE_CONTEXT = -8;
    OMP_IPR_TARGETSYNC     = -9;
    OMP_IPR_FIRST          = -9;
  end

  type OMP_INTEROP_PROPERTY_T = OMP_INTEROP_PROPERTY;

  OMP_INTEROP_NONE = 0;

  enum OMP_INTEROP_RC
    OMP_IRC_NO_VALUE     = 1;
    OMP_IRC_SUCCESS      = 0;
    OMP_IRC_EMPTY        = -1;
    OMP_IRC_OUT_OF_RANGE = -2;
    OMP_IRC_TYPE_INT     = -3;
    OMP_IRC_TYPE_PTR     = -4;
    OMP_IRC_TYPE_STR     = -5;
    OMP_IRC_OTHER        = -6;
  end

  type OMP_INTEROP_RC_T = OMP_INTEROP_RC;

  enum OMP_INTEROP_FR
    OMP_IFR_CUDA        = 1;
    OMP_IFR_CUDA_DRIVER = 2;
    OMP_IFR_OPENCL      = 3;
    OMP_IFR_SYCL        = 4;
    OMP_IFR_HIP         = 5;
    OMP_IFR_LEVEL_ZERO  = 6;
    OMP_IFR_LAST        = 7;
  end

  type OMP_INTEROP_T = Void*;

  # The `omp_get_num_interop_properties` routine retrieves the number of implementation-defined properties available for an `omp_interop_t` object.
  fun omp_get_num_interop_properties (OMP_INTEROP_T) : LibC::Int;

  # The `omp_get_interop_int` routine retrieves an integer property from an `omp_interop_t` object.
  fun omp_get_interop_int (OMP_INTEROP_T, OMP_INTEROP_PROPERTY_T, LibC::Int*) : OMP_INTPTR_T;

  # The `omp_get_interop_ptr` routine retrieves a pointer property from an `omp_interop_t` object.
  fun omp_get_interop_ptr (OMP_INTEROP_T, OMP_INTEROP_PROPERTY_T, LibC::Int*) : Void*;

  # The `omp_get_interop_str` routine retrieves a string property from an `omp_interop_t` object.
  fun omp_get_interop_str (OMP_INTEROP_T, OMP_INTEROP_PROPERTY_T, LibC::Int*) : LibC::Char*;

  # The `omp_get_interop_name` routine retrieves a property name from an `omp_interop_t` object.
  fun omp_get_interop_name (OMP_INTEROP_T, OMP_INTEROP_PROPERTY_T) : LibC::Char*;

  # The `omp_get_interop_type_desc` routine retrieves a description of the type of a property associated with an `omp_interop_t` object.
  fun omp_get_interop_type_desc (OMP_INTEROP_T, OMP_INTEROP_PROPERTY_T) : LibC::Char*;

  # The `omp_get_interop_rc_desc` routine retrieves a description of the return code associated with an `omp_interop_t` object.
  fun omp_get_interop_rc_desc (OMP_INTEROP_T, OMP_INTEROP_RC_T) : LibC::Char*;

  # OpenMP 5.1 device memory routines

  # The `omp_target_memcpy_async` routine asynchronously performs a copy between any combination of host and device pointers.
  fun omp_target_memcpy_async (Void*, Void*, LibC::SizeT, LibC::SizeT, LibC::SizeT, LibC::Int, LibC::Int, LibC::Int, OMP_DEPEND_T*) : LibC::Int;

  # The `omp_target_memcpy_rect_async` routine asynchronously performs a copy between any combination of host and device pointers.
  fun omp_target_memcpy_rect_async (Void*, Void*, LibC::SizeT, LibC::Int, LibC::SizeT*, LibC::SizeT*, LibC::SizeT*, LibC::SizeT*, LibC::SizeT*, LibC::Int, LibC::Int, LibC::Int, OMP_DEPEND_T*) : LibC::Int;

  # The `omp_get_mapped_ptr` routine returns the device pointer that is associated with a host pointer for a given device.
  fun omp_get_mapped_ptr(Void*, LibC::Int) : Void*;
  fun omp_target_is_accessible(Void*, LibC::SizeT, LibC::Int) : LibC::Int;

  # kmp API functions
  fun kmp_get_stacksize                        : LibC::Int;
  fun kmp_set_stacksize          (LibC::Int)   : Void;
  fun kmp_get_stacksize_s                      : LibC::SizeT;
  fun kmp_set_stacksize_s        (LibC::SizeT) : Void;
  fun kmp_get_blocktime                        : LibC::Int;
  fun kmp_get_library                          : LibC::Int;
  fun kmp_set_blocktime          (LibC::Int)   : Void;
  fun kmp_set_library            (LibC::Int)   : Void;
  fun kmp_set_library_serial                   : Void;
  fun kmp_set_library_turnaround               : Void;
  fun kmp_set_library_throughput               : Void;
  fun kmp_set_defaults           (LibC::Char*) : Void;
  fun kmp_set_disp_num_buffers   (LibC::Int)   : Void;

  # Intel affinity API
  type KMP_AFFINITY_MASK_T = Void*;

  fun kmp_set_affinity             (KMP_AFFINITY_MASK_T*)            : LibC::Int;
  fun kmp_get_affinity             (KMP_AFFINITY_MASK_T*)            : LibC::Int;
  fun kmp_get_affinity_max_proc                                      : LibC::Int;
  fun kmp_create_affinity_mask     (KMP_AFFINITY_MASK_T*)            : Void;
  fun kmp_destroy_affinity_mask    (KMP_AFFINITY_MASK_T*)            : Void;
  fun kmp_set_affinity_mask_proc   (LibC::Int, KMP_AFFINITY_MASK_T*) : LibC::Int;
  fun kmp_unset_affinity_mask_proc (LibC::Int, KMP_AFFINITY_MASK_T*) : LibC::Int;
  fun kmp_get_affinity_mask_proc   (LibC::Int, KMP_AFFINITY_MASK_T*) : LibC::Int;

  # OpenMP 4.0 affinity API
  enum OMP_PROC_BIND_T
    OMP_PROC_BIND_FALSE  = 0;
    OMP_PROC_BIND_TRUE   = 1;
    OMP_PROC_BIND_MASTER = 2;
    OMP_PROC_BIND_CLOSE  = 3;
    OMP_PROC_BIND_SPREAD = 4;
  end

  fun omp_get_proc_bind : OMP_PROC_BIND_T;

  # OpenMP 4.5 affinity API
  fun omp_get_num_places                                   : LibC::Int;
  fun omp_get_place_num_procs      (LibC::Int)             : LibC::Int;
  fun omp_get_place_proc_ids       (LibC::Int, LibC::Int*) : Void;
  fun omp_get_place_num                                    : LibC::Int;
  fun omp_get_partition_num_places                         : LibC::Int;
  fun omp_get_partition_place_nums (LibC::Int *)           : Void;

  fun kmp_malloc         (LibC::SizeT)              : Void*;
  fun kmp_aligned_malloc (LibC::SizeT, LibC::SizeT) : Void*;
  fun kmp_calloc         (LibC::SizeT, LibC::SizeT) : Void*;
  fun kmp_realloc        (Void*, LibC::SizeT)       : Void*;
  fun kmp_free           (Void*)                    : Void;

  fun kmp_set_warnings_on  : Void;
  fun kmp_set_warnings_off : Void;

  # OpenMP 5.0 Tool Control
  enum OMP_CONTROL_TOOL_RESULT_T
    OMP_CONTROL_TOOL_NOTOOL     = -2;
    OMP_CONTROL_TOOL_NOCALLBACK = -1;
    OMP_CONTROL_TOOL_SUCCESS    = 0;
    OMP_CONTROL_TOOL_IGNORED    = 1;
  end

  enum OMP_CONTROL_TOOL_T
    OMP_CONTROL_TOOL_START = 1;
    OMP_CONTROL_TOOL_PAUSE = 2;
    OMP_CONTROL_TOOL_FLUSH = 3;
    OMP_CONTROL_TOOL_END   = 4;
  end

  fun omp_control_tool (LibC::Int, LibC::Int, Void*) : LibC::Int;

  # OpenMP 5.0 Memory Management
  type OMP_UINTPTR_T = LibC::ULong;

  enum OMP_ALLOCTRAIT_KEY_T
    OMP_ATK_SYNC_HINT = 1;
    OMP_ATK_ALIGNMENT = 2;
    OMP_ATK_ACCESS    = 3;
    OMP_ATK_POOL_SIZE = 4;
    OMP_ATK_FALLBACK  = 5;
    OMP_ATK_FB_DATA   = 6;
    OMP_ATK_PINNED    = 7;
    OMP_ATK_PARTITION = 8;
  end

  enum OMP_ALLOCTRAIT_VALUE_T
    OMP_ATV_FALSE          = 0;
    OMP_ATV_TRUE           = 1;
    OMP_ATV_CONTENDED      = 3;
    OMP_ATV_UNCONTENDED    = 4;
    OMP_ATV_SERIALIZED     = 5;
    OMP_ATV_SEQUENTIAL     = OMP_ATV_SERIALIZED; # (deprecated)
    OMP_ATV_PRIVATE        = 6;
    OMP_ATV_ALL            = 7;
    OMP_ATV_THREAD         = 8;
    OMP_ATV_PTEAM          = 9;
    OMP_ATV_CGROUP         = 10;
    OMP_ATV_DEFAULT_MEM_FB = 11;
    OMP_ATV_NULL_FB        = 12;
    OMP_ATV_ABORT_FB       = 13;
    OMP_ATV_ALLOCATOR_FB   = 14;
    OMP_ATV_ENVIRONMENT    = 15;
    OMP_ATV_NEAREST        = 16;
    OMP_ATV_BLOCKED        = 17;
    OMP_ATV_INTERLEAVED    = 18;
  end
  OMP_ATV_DEFAULT = UINT64_MAX;

  struct OMP_ALLOCTRAIT_T
    key   : OMP_ALLOCTRAIT_KEY_T;
    value : OMP_ALLOCTRAIT_VALUE_T;
  end

  {% if flag? :win32 %}
    # On Windows cl and icl do not support 64-bit enum, let's use integer then.
    type OMP_ALLOCATOR_HANDLE_T = OMP_UINTPTR_T;
    # fun __KMP_IMP OMP_ALLOCATOR_HANDLE_T omp_null_allocator               : Void;
    # fun __KMP_IMP OMP_ALLOCATOR_HANDLE_T omp_default_mem_alloc            : Void;
    # fun __KMP_IMP OMP_ALLOCATOR_HANDLE_T omp_large_cap_mem_alloc          : Void;
    # fun __KMP_IMP OMP_ALLOCATOR_HANDLE_T omp_const_mem_alloc              : Void;
    # fun __KMP_IMP OMP_ALLOCATOR_HANDLE_T omp_high_bw_mem_alloc            : Void;
    # fun __KMP_IMP OMP_ALLOCATOR_HANDLE_T omp_low_lat_mem_alloc            : Void;
    # fun __KMP_IMP OMP_ALLOCATOR_HANDLE_T omp_cgroup_mem_alloc             : Void;
    # fun __KMP_IMP OMP_ALLOCATOR_HANDLE_T omp_pteam_mem_alloc              : Void;
    # fun __KMP_IMP OMP_ALLOCATOR_HANDLE_T omp_thread_mem_alloc             : Void;
    # fun __KMP_IMP OMP_ALLOCATOR_HANDLE_T llvm_omp_target_host_mem_alloc   : Void;
    # fun __KMP_IMP OMP_ALLOCATOR_HANDLE_T llvm_omp_target_shared_mem_alloc : Void;
    # fun __KMP_IMP OMP_ALLOCATOR_HANDLE_T llvm_omp_target_device_mem_alloc : Void;

    type OMP_MEMSPACE_HANDLE_T = OMP_UINTPTR_T;
    # fun __KMP_IMP OMP_MEMSPACE_HANDLE_T omp_default_mem_space            : Void;
    # fun __KMP_IMP OMP_MEMSPACE_HANDLE_T omp_large_cap_mem_space          : Void;
    # fun __KMP_IMP OMP_MEMSPACE_HANDLE_T omp_const_mem_space              : Void;
    # fun __KMP_IMP OMP_MEMSPACE_HANDLE_T omp_high_bw_mem_space            : Void;
    # fun __KMP_IMP OMP_MEMSPACE_HANDLE_T omp_low_lat_mem_space            : Void;
    # fun __KMP_IMP OMP_MEMSPACE_HANDLE_T llvm_omp_target_host_mem_space   : Void;
    # fun __KMP_IMP OMP_MEMSPACE_HANDLE_T llvm_omp_target_shared_mem_space : Void;
    # fun __KMP_IMP OMP_MEMSPACE_HANDLE_T llvm_omp_target_device_mem_space : Void;
  {% else %}
    enum OMP_ALLOCATOR_HANDLE_T : UInt64
      OMP_NULL_ALLOCATOR               = 0;
      OMP_DEFAULT_MEM_ALLOC            = 1;
      OMP_LARGE_CAP_MEM_ALLOC          = 2;
      OMP_CONST_MEM_ALLOC              = 3;
      OMP_HIGH_BW_MEM_ALLOC            = 4;
      OMP_LOW_LAT_MEM_ALLOC            = 5;
      OMP_CGROUP_MEM_ALLOC             = 6;
      OMP_PTEAM_MEM_ALLOC              = 7;
      OMP_THREAD_MEM_ALLOC             = 8;
      LLVM_OMP_TARGET_HOST_MEM_ALLOC   = 100;
      LLVM_OMP_TARGET_SHARED_MEM_ALLOC = 101;
      LLVM_OMP_TARGET_DEVICE_MEM_ALLOC = 102;
      KMP_ALLOCATOR_MAX_HANDLE         = UINTPTR_MAX;
    end

    enum OMP_MEMSPACE_HANDLE_T : UInt64
      OMP_DEFAULT_MEM_SPACE            = 0;
      OMP_LARGE_CAP_MEM_SPACE          = 1;
      OMP_CONST_MEM_SPACE              = 2;
      OMP_HIGH_BW_MEM_SPACE            = 3;
      OMP_LOW_LAT_MEM_SPACE            = 4;
      LLVM_OMP_TARGET_HOST_MEM_SPACE   = 100;
      LLVM_OMP_TARGET_SHARED_MEM_SPACE = 101;
      LLVM_OMP_TARGET_DEVICE_MEM_SPACE = 102;
      KMP_MEMSPACE_MAX_HANDLE          = UINTPTR_MAX;
    end
  {% end %}

  fun omp_init_allocator        (m : OMP_MEMSPACE_HANDLE_T, ntraits : LibC::Int, traits : OMP_ALLOCTRAIT_T*) : OMP_ALLOCATOR_HANDLE_T;
  fun omp_destroy_allocator     (allocator : OMP_ALLOCATOR_HANDLE_T) : Void;
  fun omp_set_default_allocator (a : OMP_ALLOCATOR_HANDLE_T) : Void;
  fun omp_get_default_allocator : OMP_ALLOCATOR_HANDLE_T;

  fun omp_alloc          (size : LibC::SizeT, a : OMP_ALLOCATOR_HANDLE_T) : Void*;
  fun omp_aligned_alloc  (align : LibC::SizeT, size : LibC::SizeT, a : OMP_ALLOCATOR_HANDLE_T) : Void*;
  fun omp_calloc         (nmemb : LibC::SizeT, size : LibC::SizeT, a : OMP_ALLOCATOR_HANDLE_T) : Void*;
  fun omp_aligned_calloc (align : LibC::SizeT, nmemb : LibC::SizeT, size : LibC::SizeT, a : OMP_ALLOCATOR_HANDLE_T) : Void*;
  fun omp_realloc        (ptr : Void*, size : LibC::SizeT, allocator : OMP_ALLOCATOR_HANDLE_T, free_allocator : OMP_ALLOCATOR_HANDLE_T) : Void*;
  fun omp_free           (ptr : Void*, a : OMP_ALLOCATOR_HANDLE_T) : Void;

  # OpenMP 5.0 Affinity Format
  fun omp_set_affinity_format (LibC::Char*)                           : Void;
  fun omp_get_affinity_format (LibC::Char*, LibC::SizeT)              : LibC::SizeT;
  fun omp_display_affinity    (LibC::Char*)                           : Void;
  fun omp_capture_affinity    (LibC::Char*, LibC::SizeT, LibC::Char*) : LibC::SizeT;

  # OpenMP 5.0 events
  {% if flag? :win32 %}
    # On Windows cl and icl do not support 64-bit enum, let's use integer then.
    type OMP_EVENT_HANDLE_T = OMP_UINTPTR_T;
  {% else %}
    enum OMP_EVENT_HANDLE_T : UInt64
      KMP_EVENT_MAX_HANDLE = UINTPTR_MAX;
    end
  {% end %}
  fun omp_fulfill_event (event : OMP_EVENT_HANDLE_T) : Void;

  # OpenMP 5.0 Pause Resources
  enum OMP_PAUSE_RESOURCE_T
    OMP_PAUSE_RESUME = 0;
    OMP_PAUSE_SOFT   = 1;
    OMP_PAUSE_HARD   = 2;
  end
  fun omp_pause_resource     (OMP_PAUSE_RESOURCE_T, LibC::Int) : LibC::Int;
  fun omp_pause_resource_all (OMP_PAUSE_RESOURCE_T)            : LibC::Int;

  fun omp_get_supported_active_levels : LibC::Int;

  # OpenMP 5.1 Display Environment
  fun omp_display_env (verbose : LibC::Int) : Void;

  # OpenMP 5.2
  fun omp_in_explicit_task : LibC::Int;

  # LLVM Extensions
  fun llvm_omp_target_dynamic_shared_alloc : Void*;

  # Warning:
  #  The following typedefs are not standard, deprecated and will be removed in a future release.
  type OMP_INT_T   = LibC::Int;
  type OMP_WTIME_T = LibC::Double;
end
