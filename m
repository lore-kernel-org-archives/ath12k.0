Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA75D1BDEB
	for <ath12k@archiver.kernel.org>; Mon,  4 Nov 2024 20:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XCnm/onUR7PA5VTV69FvCRwhKNLS/nytt0JnyMVuDg0=; b=aFqPvRsEx1KRE2xRqdjJPhCkMi
	ihq8Qse2LMq7HX6090Fvgrhb/v2gQ5wMWdw83h32koOz5nVQSjpbEE9I44wORiEukzUWP/EV9jLIb
	NH2JtLkgwIuzNhZsm2YD868zz19kfOuby+UJKru7XPaf9aTyX0EY83kcmM+ZJjACG87Iuw6wlkLSG
	pMfEe3cmZ+5clq3ZsgyuVDT7pQ04T/hK/oJI9WNOaJgao1gf1TRp6WUxK4+8x15dQn6ROqr8dccpq
	JNIjd9MXxjHWD48r19bAwe60d2ufw2C0nt+HHpuPnwaMWRhwV0/HqF6/wQy3qfl19hJz+rKRBt6Pj
	7V3i/tTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t83Wh-0000000F0E2-3CR4
	for ath12k@archiver.kernel.org;
	Mon, 04 Nov 2024 20:18:15 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t83We-0000000F0DN-0Sf0
	for ath12k@lists.infradead.org;
	Mon, 04 Nov 2024 20:18:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 44358A403AA;
	Mon,  4 Nov 2024 20:16:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 527A4C4CECE;
	Mon,  4 Nov 2024 20:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730751491;
	bh=pflxZGIfk80/m0RGcrJkM9Byb5SifgUbCWlGSC0xRiM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=OK4BDwoCcNFfPsQlHeyrck13aWOd0AB4dkZrPIx3Dd9T6udaQChmF97UcsPEKYIov
	 4UPJ0MFbuKR7ajfn84gqL/xQCFw8WrBZ8smLsnYjBVxhiVMwLbNKFXxUtrPRMGqbNC
	 Mug1ZfcAmVu+w6wnWFVu5fXj08L5drgq/XJ2BR820hEbq5ACThyDbuSU/U9qoS9Oqd
	 1siQvXlzyPUMkpjaNNiD5DqO93+0ankSii92sjJYKVMw99Eg3PLqLd0oSBseXJbXmW
	 VzdJbL9EI0rEC2X3EE/mDgsnXrRHrAPpFDqh+67gskt1Mk2XYsa6SAb0wpPBfSgVRC
	 nHE13BfrQ3cyA==
From: Kalle Valo <kvalo@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev,  Rameshkumar Sundaram
 <quic_ramess@quicinc.com>,  lkp@intel.com,  oe-kbuild-all@lists.linux.dev,
  Jeff Johnson <jjohnson@kernel.org>,  ath12k@lists.infradead.org
Subject: Re: [ath:ath12k-mlo-qcn9274 /81]
 drivers/net/wireless/ath/ath12k/mac.c:4304 ath12k_mac_op_set_key() error:
 uninitialized symbol 'ret'.
References: <7e7afd00-ad84-4744-8d94-416bab7e7dd9@stanley.mountain>
Date: Mon, 04 Nov 2024 22:18:07 +0200
In-Reply-To: <7e7afd00-ad84-4744-8d94-416bab7e7dd9@stanley.mountain> (Dan
	Carpenter's message of "Wed, 9 Oct 2024 14:09:53 +0300")
Message-ID: <87a5ee7ny8.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_121812_302755_EE592ABF 
X-CRM114-Status: GOOD (  16.84  )
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

Dan Carpenter <dan.carpenter@linaro.org> writes:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-mlo-qcn9274
> head:   7435d14d41d5d479a5e6a8a2cd4efdac9d928823
> commit: 573de29145bf929c428f9e2dc55ad3f5f3da8453 [/81] wifi: ath12k: modify ath12k_mac_op_set_key for MLO
> config: csky-randconfig-r072-20241008
> (https://download.01.org/0day-ci/archive/20241009/202410090311.SK1SO5GL-lkp@intel.com/config)
> compiler: csky-linux-gcc (GCC) 14.1.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202410090311.SK1SO5GL-lkp@intel.com/
>
> New smatch warnings:
> drivers/net/wireless/ath/ath12k/mac.c:4304 ath12k_mac_op_set_key() error: uninitialized symbol 'ret'.
>
> vim +/ret +4304 drivers/net/wireless/ath/ath12k/mac.c
>
> b5068bc9180d06 Sriram R 2024-04-09 4222 static int
> ath12k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
> b5068bc9180d06 Sriram R 2024-04-09 4223 struct ieee80211_vif *vif,
> struct ieee80211_sta *sta,
> b5068bc9180d06 Sriram R             2024-04-09  4224  				 struct ieee80211_key_conf *key)
> b5068bc9180d06 Sriram R             2024-04-09  4225  {
> 18333c4baa4d72 Sriram R             2024-01-27  4226  	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
> 18333c4baa4d72 Sriram R             2024-01-27  4227  	struct ath12k_link_vif *arvif;
> 611aacdb3540ff Sriram R             2024-04-14  4228  	struct ath12k_link_sta *arsta = NULL;
> b5068bc9180d06 Sriram R             2024-04-09  4229  	struct ath12k_vif_cache *cache;
> 611aacdb3540ff Sriram R             2024-04-14  4230  	struct ath12k_sta *ahsta;
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4231  	unsigned long links;
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4232  	u8 link_id;
> b5068bc9180d06 Sriram R             2024-04-09  4233  	int ret;
> b5068bc9180d06 Sriram R             2024-04-09  4234  
> d4243fd891671d Kalle Valo           2024-09-25  4235  	lockdep_assert_wiphy(hw->wiphy);
> d4243fd891671d Kalle Valo           2024-09-25  4236  
> b5068bc9180d06 Sriram R             2024-04-09  4237  	/* BIP needs to be done in software */
> b5068bc9180d06 Sriram R             2024-04-09  4238  	if (key->cipher == WLAN_CIPHER_SUITE_AES_CMAC ||
> b5068bc9180d06 Sriram R             2024-04-09  4239  	    key->cipher == WLAN_CIPHER_SUITE_BIP_GMAC_128 ||
> b5068bc9180d06 Sriram R             2024-04-09  4240  	    key->cipher == WLAN_CIPHER_SUITE_BIP_GMAC_256 ||
> 18333c4baa4d72 Sriram R             2024-01-27  4241  	    key->cipher == WLAN_CIPHER_SUITE_BIP_CMAC_256) {
> b5068bc9180d06 Sriram R             2024-04-09  4242  		return 1;
> 18333c4baa4d72 Sriram R             2024-01-27  4243  	}
> b5068bc9180d06 Sriram R             2024-04-09  4244  
> b5068bc9180d06 Sriram R             2024-04-09  4245  	if (key->keyidx > WMI_MAX_KEY_INDEX)
> b5068bc9180d06 Sriram R             2024-04-09  4246  		return -ENOSPC;
> b5068bc9180d06 Sriram R             2024-04-09  4247  
> b5068bc9180d06 Sriram R             2024-04-09  4248  	if (sta) {
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4249  		ahsta = ath12k_sta_to_ahsta(sta);
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09 4250 /* For an ML STA
> Pairwise key is same for all associated link Stations,
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09 4251 * hence do set key
> for all link STAs which are active.
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4252  		 */
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4253  		if (sta->mlo) {
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4254  			links = ahsta->links_map;
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09 4255
> for_each_set_bit(link_id, &links, IEEE80211_MLD_MAX_NUM_LINKS) {
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09 4256 arvif =
> wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09 4257 arsta =
> wiphy_dereference(hw->wiphy, ahsta->link[link_id]);
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4258  
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4259  				if (WARN_ON(!arvif || !arsta))
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09 4260 /* arvif and arsta
> are expected to be valid when
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4261  					 * STA is present.
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4262  					 */
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4263  					continue;
>
> Is it possible that there are no set bits or that we always hit this continue?

Actually I'm not fully sure if links_map can be zero but I would not
assume so.

> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4264  
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09 4265 ret =
> ath12k_mac_set_key(arvif->ar, cmd, arvif,
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09 4266 arsta, key);
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4267  				if (ret)
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4268  					break;
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4269  			}
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4270  		} else {
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4271  			arsta = &ahsta->deflink;
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4272  			arvif = arsta->arvif;
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4273  			if (WARN_ON(!arvif)) {
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4274  				ret = -EINVAL;
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4275  				goto out;
> b5068bc9180d06 Sriram R             2024-04-09  4276  			}
> b5068bc9180d06 Sriram R             2024-04-09  4277  
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09 4278 ret =
> ath12k_mac_set_key(arvif->ar, cmd, arvif, arsta, key);
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4279  		}
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4280  	} else {
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09 4281 if (key->link_id
>>= 0 && key->link_id < IEEE80211_MLD_MAX_NUM_LINKS) {
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4282  			link_id = key->link_id;
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09 4283 arvif =
> wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4284  		} else {
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4285  			link_id = 0;
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4286  			arvif = &ahvif->deflink;
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4287  		}
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4288  
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4289  		if (!arvif || !arvif->is_created) {
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09 4290 cache =
> ath12k_ahvif_get_link_cache(ahvif, link_id);
> b5068bc9180d06 Sriram R             2024-04-09  4291  			if (!cache)
> b5068bc9180d06 Sriram R             2024-04-09  4292  				return -ENOSPC;
> 18333c4baa4d72 Sriram R             2024-01-27  4293  
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09 4294 ret =
> ath12k_mac_update_key_cache(cache, cmd, sta, key);
> 18333c4baa4d72 Sriram R             2024-01-27  4295  
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4296  			return ret;
> b5068bc9180d06 Sriram R             2024-04-09  4297  		}
> b5068bc9180d06 Sriram R             2024-04-09  4298  
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09 4299 ret =
> ath12k_mac_set_key(arvif->ar, cmd, arvif, NULL, key);
> 611aacdb3540ff Sriram R             2024-04-14  4300  	}
> 611aacdb3540ff Sriram R             2024-04-14  4301  
> 573de29145bf92 Rameshkumar Sundaram 2024-08-09  4302  out:
> 18333c4baa4d72 Sriram R             2024-01-27  4303  
> d889913205cf7e Kalle Valo           2022-11-28 @4304  	return ret;
>
> If so then ret is uninitialized

Thanks for the report, I fixed it like this in ath12k-mlo branch (not
yet submitted for review):

https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=ath12k-mlo&id=1ed8ae547f604b6c6176aeadd98bd192c9031066

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

