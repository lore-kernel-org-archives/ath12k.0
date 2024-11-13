Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2505AD41C32
	for <ath12k@archiver.kernel.org>; Wed, 13 Nov 2024 10:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cJqw/H6Ysk7pEE+iQQq07UMDa/9NLh/rm1eYV6BzKuw=; b=kaRN0i7/QEVGDVKr+pOy5T8wnY
	7ggE8LEqc7hiaBUDYqE+7JP3ZvIBmSoy7cTvcIfHDsxXFlL9Tv6hwXnehW5Kv8I0SP04r5C9GRst3
	AL1xK2xukw8zPLqXJnjnVe0ynCsQIboUfIVjnWnE2xmyuC/UsiOE0voSVtSpnfyVn46/6kFiEQEAM
	YbUJgfeiYIP7By/bWQew8YxdkYs0jOib1721qCCP8OsGuKmCEYgeMkrKb0dZdjRlMLBbxvtk/83rl
	LtLWrgCJjRPVr+R0fLqnEO06Z1mxVCYW9HrcdfSsmfLiQ49QOcDpFDXvO/kp1Y5T5AgQTwAVT+6Sh
	VwoeGotQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBAka-00000006TJT-3XAD
	for ath12k@archiver.kernel.org;
	Wed, 13 Nov 2024 10:37:28 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBAfG-00000006SC0-3BmR
	for ath12k@lists.infradead.org;
	Wed, 13 Nov 2024 10:32:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731493918; x=1763029918;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YwL8dCrv8mI8yNrHJ0bQ/F7ixaa5kTNW7tA5zRCqsQE=;
  b=MSNbMjAkRusJ1SQmVhCfe5rxZo2UuEZKI1laizaKptQ2LEEWoGToFgQ9
   RLQv2RKza7bPvj9xqzTMsugQy5bXFTK9EurkCgXBx12fMhFtcacyEcHw+
   wItoOSUCTFiAANeKeAS6gKuSnfisE3UozT2G9pUBPpX4Hat3bMbuU/sZ1
   LJnQY8AR9fdM+OxLcV20NqSjdnFTFZOj/WAlpifFC/ottW/LRHqwN/vAi
   L6NZN6nN+8TPW/tMMCS4ZifAYUKyQ1JLCW8CneCSTWvQGKK3g8j6QO58J
   4AnD1DMcNnss1e+v9tZR7lPE/NkJAyl7fVhbOs7LS3TeVcOerCkp6LLkM
   A==;
X-CSE-ConnectionGUID: rwmOTWjJROSWVCKVfD4EmA==
X-CSE-MsgGUID: kZ6yualgSLiMYVex6CubZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="56770598"
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="56770598"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 02:31:56 -0800
X-CSE-ConnectionGUID: scTAZ3eXRPm7vy090WkN4g==
X-CSE-MsgGUID: PymFqlT5SgC/h4KW9hSICQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="92795421"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Nov 2024 02:31:54 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBAfA-0000F5-0R;
	Wed, 13 Nov 2024 10:31:52 +0000
Date: Wed, 13 Nov 2024 18:31:45 +0800
From: kernel test robot <lkp@intel.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Jeff Johnson <jjohnson@kernel.org>,
	Kalle Valo <kvalo@kernel.org>, ath12k@lists.infradead.org,
	Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: [ath:master 2/4] drivers/net/ethernet/intel/ice/ice_ptp.c:165:15:
 error: implicit declaration of function 'ice_read_sma_ctrl'; did you mean
 'ice_read_sr_word'?
Message-ID: <202411131838.DE0FWg8Q-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_023159_086098_4A786C31 
X-CRM114-Status: GOOD (  12.04  )
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git master
head:   fc6f018eda7f9054e427f731db1e8b200f22873c
commit: 33e2bcda33620fc43cc948627be525ddb342c446 [2/4] Merge branch 'ath-current'
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20241113/202411131838.DE0FWg8Q-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411131838.DE0FWg8Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411131838.DE0FWg8Q-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/net/ethernet/intel/ice/ice_ptp.c: In function 'ice_ptp_set_sma_cfg':
>> drivers/net/ethernet/intel/ice/ice_ptp.c:165:15: error: implicit declaration of function 'ice_read_sma_ctrl'; did you mean 'ice_read_sr_word'? [-Werror=implicit-function-declaration]
     165 |         err = ice_read_sma_ctrl(&pf->hw, &data);
         |               ^~~~~~~~~~~~~~~~~
         |               ice_read_sr_word
>> drivers/net/ethernet/intel/ice/ice_ptp.c:187:16: error: implicit declaration of function 'ice_write_sma_ctrl'; did you mean 'ice_write_intrl'? [-Werror=implicit-function-declaration]
     187 |         return ice_write_sma_ctrl(&pf->hw, data);
         |                ^~~~~~~~~~~~~~~~~~
         |                ice_write_intrl
   drivers/net/ethernet/intel/ice/ice_ptp.c: In function 'ice_ptp_set_funcs_e810':
>> drivers/net/ethernet/intel/ice/ice_ptp.c:2556:15: error: implicit declaration of function 'ice_ptp_read_sdp_ac' [-Werror=implicit-function-declaration]
    2556 |         err = ice_ptp_read_sdp_ac(&pf->hw, entries, &num_entries);
         |               ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
>> drivers/net/ethernet/intel/ice/ice_ptp_hw.c:5250:5: warning: no previous prototype for 'ice_read_sma_ctrl' [-Wmissing-prototypes]
    5250 | int ice_read_sma_ctrl(struct ice_hw *hw, u8 *data)
         |     ^~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_ptp_hw.c:5283:5: warning: no previous prototype for 'ice_write_sma_ctrl' [-Wmissing-prototypes]
    5283 | int ice_write_sma_ctrl(struct ice_hw *hw, u8 data)
         |     ^~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_ptp_hw.c:5314:5: warning: no previous prototype for 'ice_read_pca9575_reg' [-Wmissing-prototypes]
    5314 | int ice_read_pca9575_reg(struct ice_hw *hw, u8 offset, u8 *data)
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_ptp_hw.c:5346:5: warning: no previous prototype for 'ice_ptp_read_sdp_ac' [-Wmissing-prototypes]
    5346 | int ice_ptp_read_sdp_ac(struct ice_hw *hw, __le16 *entries, uint *num_entries)
         |     ^~~~~~~~~~~~~~~~~~~
   during RTL pass: mach
   drivers/net/ethernet/intel/ice/ice_ptp_hw.c: In function 'ice_write_cgu_reg_e82x':
   drivers/net/ethernet/intel/ice/ice_ptp_hw.c:289:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9703
     289 | }
         | ^
   0x5b78c1 arc_ifcvt
   	/tmp/build-crosstools-gcc-13.2.0-binutils-2.41/gcc/gcc-13.2.0/gcc/config/arc/arc.cc:9703
   0xe431b4 arc_reorg
   	/tmp/build-crosstools-gcc-13.2.0-binutils-2.41/gcc/gcc-13.2.0/gcc/config/arc/arc.cc:8552
   0xaed299 execute
   	/tmp/build-crosstools-gcc-13.2.0-binutils-2.41/gcc/gcc-13.2.0/gcc/reorg.cc:3927
   Please submit a full bug report, with preprocessed source (by using -freport-bug).
   Please include the complete backtrace with any bug report.
   See <https://gcc.gnu.org/bugs/> for instructions.
--
   drivers/net/ethernet/intel/ice/ice_gnss.c: In function 'ice_gnss_is_gps_present':
>> drivers/net/ethernet/intel/ice/ice_gnss.c:400:23: error: implicit declaration of function 'ice_read_pca9575_reg'; did you mean 'ice_read_pca9575_reg_e810t'? [-Werror=implicit-function-declaration]
     400 |                 err = ice_read_pca9575_reg(hw, ICE_PCA9575_P0_IN, &data);
         |                       ^~~~~~~~~~~~~~~~~~~~
         |                       ice_read_pca9575_reg_e810t
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +165 drivers/net/ethernet/intel/ice/ice_ptp.c

325b2064d00a88 Maciej Machnikowski 2021-08-17  149  
325b2064d00a88 Maciej Machnikowski 2021-08-17  150  /**
e4291b64e11889 Karol Kolacinski    2024-08-30  151   * ice_ptp_set_sma_cfg - set the configuration of the SMA control logic
e4291b64e11889 Karol Kolacinski    2024-08-30  152   * @pf: Board private structure
325b2064d00a88 Maciej Machnikowski 2021-08-17  153   *
e4291b64e11889 Karol Kolacinski    2024-08-30  154   * Return: 0 on success, negative error code otherwise
325b2064d00a88 Maciej Machnikowski 2021-08-17  155   */
e4291b64e11889 Karol Kolacinski    2024-08-30  156  static int ice_ptp_set_sma_cfg(struct ice_pf *pf)
325b2064d00a88 Maciej Machnikowski 2021-08-17  157  {
e4291b64e11889 Karol Kolacinski    2024-08-30  158  	const struct ice_ptp_pin_desc *ice_pins = pf->ptp.ice_pin_desc;
e4291b64e11889 Karol Kolacinski    2024-08-30  159  	struct ptp_pin_desc *pins = pf->ptp.pin_desc;
e4291b64e11889 Karol Kolacinski    2024-08-30  160  	unsigned int sma_pins[ICE_SMA_PINS_NUM] = {};
e4291b64e11889 Karol Kolacinski    2024-08-30  161  	int err;
325b2064d00a88 Maciej Machnikowski 2021-08-17  162  	u8 data;
325b2064d00a88 Maciej Machnikowski 2021-08-17  163  
325b2064d00a88 Maciej Machnikowski 2021-08-17  164  	/* Read initial pin state value */
e4291b64e11889 Karol Kolacinski    2024-08-30 @165  	err = ice_read_sma_ctrl(&pf->hw, &data);
325b2064d00a88 Maciej Machnikowski 2021-08-17  166  	if (err)
325b2064d00a88 Maciej Machnikowski 2021-08-17  167  		return err;
325b2064d00a88 Maciej Machnikowski 2021-08-17  168  
e4291b64e11889 Karol Kolacinski    2024-08-30  169  	/* Get SMA/U.FL pins states */
e4291b64e11889 Karol Kolacinski    2024-08-30  170  	for (int i = 0; i < pf->ptp.info.n_pins; i++)
e4291b64e11889 Karol Kolacinski    2024-08-30  171  		if (pins[i].func) {
e4291b64e11889 Karol Kolacinski    2024-08-30  172  			int name_idx = ice_pins[i].name_idx;
e4291b64e11889 Karol Kolacinski    2024-08-30  173  
e4291b64e11889 Karol Kolacinski    2024-08-30  174  			switch (name_idx) {
e4291b64e11889 Karol Kolacinski    2024-08-30  175  			case SMA1:
e4291b64e11889 Karol Kolacinski    2024-08-30  176  			case UFL1:
e4291b64e11889 Karol Kolacinski    2024-08-30  177  			case SMA2:
e4291b64e11889 Karol Kolacinski    2024-08-30  178  			case UFL2:
e4291b64e11889 Karol Kolacinski    2024-08-30  179  				sma_pins[name_idx - 1] = pins[i].func;
325b2064d00a88 Maciej Machnikowski 2021-08-17  180  				break;
e4291b64e11889 Karol Kolacinski    2024-08-30  181  			default:
e4291b64e11889 Karol Kolacinski    2024-08-30  182  				continue;
e4291b64e11889 Karol Kolacinski    2024-08-30  183  			}
325b2064d00a88 Maciej Machnikowski 2021-08-17  184  		}
325b2064d00a88 Maciej Machnikowski 2021-08-17  185  
e4291b64e11889 Karol Kolacinski    2024-08-30  186  	ice_ptp_update_sma_data(pf, sma_pins, &data);
e4291b64e11889 Karol Kolacinski    2024-08-30 @187  	return ice_write_sma_ctrl(&pf->hw, data);
325b2064d00a88 Maciej Machnikowski 2021-08-17  188  }
325b2064d00a88 Maciej Machnikowski 2021-08-17  189  

:::::: The code at line 165 was first introduced by commit
:::::: e4291b64e11889c73fa9c75e74115721758a3fb4 ice: Align E810T GPIO to other products

:::::: TO: Karol Kolacinski <karol.kolacinski@intel.com>
:::::: CC: Tony Nguyen <anthony.l.nguyen@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

