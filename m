Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F67C4707B
	for <ath12k@archiver.kernel.org>; Sat, 13 Jan 2024 09:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p6Eb+B6YMRgsLS3XtEyomyE73GMv3ezDtKAXl2lwhYk=; b=0E20lUwYtQkaHs2XtS6Mvc/A+T
	1AaUhCzkhaR7nLuMWiRoQql5TYVZY9iKKAeOfovgv+lAvkNTD5kLW8LGhOy4woT11UeefwPpMfsIp
	8TJu/ZR+88/HNPY+xpgWFrDxIpDRsbesxWZOBwsQ4qfz88gHnvNBk7AGRiY7K+xEpMKGGHPeofoUM
	dfPrjD3xHVP6JhPy3G+9AzonB+jgTUigN2j/jWltjXORz5SR+SZn8A4yMObDo+EoO23cAF30JfMCM
	WemU63WbWkgBldOHHZoQiHK/kxcJWu7l/48v6dbBqELTcVYzkxuLOCeOaxF8wwnsBVk1C0rdb8YqD
	wZbSDqRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOaZJ-004qg1-19
	for ath12k@archiver.kernel.org;
	Sat, 13 Jan 2024 09:44:45 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOaZF-004qfT-2j
	for ath12k@lists.infradead.org;
	Sat, 13 Jan 2024 09:44:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 38FCFB82468;
	Sat, 13 Jan 2024 09:44:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C082C433C7;
	Sat, 13 Jan 2024 09:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705139079;
	bh=1hvDFRV24xJJKkGg0jYO3A1J1KEhcdugByo3G/yj7Dw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=fvqWcWqtTrHxllZ17lSGnOeJciIg627H7RZMhPFhyFImMVvFRvItdWCFNMzykwYli
	 AOi/QuzHHoFDTMhVsVFh5Cc3VpREmNQK5q3717epyYGH+weq3RZuB9Pnsqz8NbM6Yd
	 gNnezmr46goqzAaazhkQLF4dV4IkYzdCabnenIShU64nbvMMEwPuxBLMpc0olEf5dj
	 QGRWWDx+H3lYFM6oQhTyTLR51GlrsZNLjUJKmw7sAbbhodVD4hTi7YsgQGa8DVVVhM
	 wG4itUKEtvsBf/4tAsUJPyb/YzCSLygfAWmPGziSo0jwjJ+Lo4+aEGFZpxinAm65IF
	 +tmMeJiyFoDsg==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Sriram R <quic_srirrama@quicinc.com>,  <ath12k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 07/12] wifi: ath12k: Cache vdev configs before vdev create
References: <20240111045045.28377-1-quic_srirrama@quicinc.com>
	<20240111045045.28377-8-quic_srirrama@quicinc.com>
	<c35da30b-335c-4418-9d7c-0784ec9e8d30@quicinc.com>
Date: Sat, 13 Jan 2024 11:44:36 +0200
In-Reply-To: <c35da30b-335c-4418-9d7c-0784ec9e8d30@quicinc.com> (Jeff
	Johnson's message of "Fri, 12 Jan 2024 09:23:59 -0800")
Message-ID: <87cyu5h8jf.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240113_014442_051218_3603F938 
X-CRM114-Status: GOOD (  12.98  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

>> +static int ath12k_mac_op_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
>> +				 struct ieee80211_vif *vif, struct ieee80211_sta *sta,
>> +				 struct ieee80211_key_conf *key)
>> +{
>> +	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
>> +	struct ath12k *ar;
>> +	struct ath12k_vif *arvif = ath12k_vif_to_arvif(vif);
>> +	int ret;
>> +
>> +	/* BIP needs to be done in software */
>> +	if (key->cipher == WLAN_CIPHER_SUITE_AES_CMAC ||
>> +	    key->cipher == WLAN_CIPHER_SUITE_BIP_GMAC_128 ||
>> +	    key->cipher == WLAN_CIPHER_SUITE_BIP_GMAC_256 ||
>> +	    key->cipher == WLAN_CIPHER_SUITE_BIP_CMAC_256)
>> +		return 1;
>
> I know this in the existing code, but what is the significance of
> returning 1? Should this be returning a -errno like the error cases that
> follow?

It's to use software encryption, from mac80211.h:

 * Note that in the case that the @IEEE80211_HW_SW_CRYPTO_CONTROL flag is
 * set, mac80211 will not automatically fall back to software crypto if
 * enabling hardware crypto failed. The set_key() call may also return the
 * value 1 to permit this specific key/algorithm to be done in software.

Yeah, this is confusing. IMHO there should be a define or an enum for
this value.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

