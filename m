Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A785E606A33E
	for <ath12k@archiver.kernel.org>; Thu, 26 Nov 2026 08:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nrys1Otw;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PjTKbw32;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gw/2U/dH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Bzav8hbHWx8qr7iHvERvCUTKovwC54I1wXN/x0QQZHM=; b=nrys1OtwSUDkTN
	wpZpFFHmgUGqVWsOsmusyF6rPWGenBd6nqKhysUWcULhjLJ+PZlcUpcCF5Yc2IN9biXPVfHxe66ZP
	0qqzrnJiiOvQcHb0bVmjWAtC1Y6Fut6EX0NxTL8kUdPK5zMm/aLdo2osgIXblKFHiDOcCmehEIAXW
	f2shhL5JWB43AEgPg/PiugMIWW74qxI/HvfPLBXzpJR0qbRlNQkZqmxyy3MN9Rf4OJO83CVlCPNQw
	2HZY6+nD9DtKbQSIjesSe8YWB7cKmjjAt2GjUlaWExI6tz5YnZNYQmOqy6FKrH5S+NbpJ1anJPY5x
	p10Wg4fiP4yDoJbTLAmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVGU-0000000CSCM-28eP;
	Thu, 26 Nov 2026 08:55:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVGP-0000000CSAx-1Rxo
	for ath12k@lists.infradead.org;
	Thu, 26 Nov 2026 08:55:37 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B76T919512
	for <ath12k@lists.infradead.org>; Thu, 26 Nov 2026 08:55:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bzav8hbHWx8qr7iHvERvCUTKovwC54I1wXN/x0QQZHM=; b=PjTKbw32XkzJBlR9
	YATVPukDjR3qnAcLBlXqs/vYXY5i6DmdhVg+KzDe8AApFHEBoZjWgsS2rUIejWmf
	fFmz1jZKtiHf1vlFEPSfX+WO8LgMetiqixuyCpWSdwvb//dBoQViXOVeTCEPJlDf
	zFi0Fum/lhciSLOIOZlmSJjW0lEjAjvWkdcGDjiLLtmZsZgUP+x9WrYXRC5VtFM8
	i7B4vlW+zDGYdrK+PVsdzAc0Z7eX4phduPwKsv8C1gHzYGhxP2rKvcaz81veWjN7
	tg9exfkBcSWbc6CBRl7zXX/HmzOekOjKL4xm+0pX8YmuRSmcvQHkkWbA0BFfQuhb
	odmC1g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y2914-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 26 Nov 2026 08:55:32 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdb8c46e240so4046433a12.1
        for <ath12k@lists.infradead.org>; Thu, 26 Nov 2026 00:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795683332; x=1796288132; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bzav8hbHWx8qr7iHvERvCUTKovwC54I1wXN/x0QQZHM=;
        b=gw/2U/dH5ZMLv3KL2beoV+vfKivRNLDNl/0yMiHZOVj/I/RIYmEhYZB+MxFap4PbyJ
         fN6LIYvTxYkh4P0tHvnvdJHU8uNispwKs0FECoYap2TXqGkl/HDzJu05tTfN6V8HI3TT
         GbmCon/5qdyCHEW4DxkYR847qVgTf60wOxsJQfP6kIaC/ChIEPnxLr5USf65tE5RIa5p
         KVLC2GyBmtjwevGIjjHNKTyg05GukwvqQ7qaElcLQjKoZAhfmwMGLzxIiDDAXt1eEnbF
         TrJ3iRemt2mqcAGb4vXgsm5lH0RHavPBq1w9vZgxcFrSRwNyjLrE5fmXQiYtxEW4GCim
         R1Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795683332; x=1796288132;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bzav8hbHWx8qr7iHvERvCUTKovwC54I1wXN/x0QQZHM=;
        b=HWUP3DjJ6M8sfLJsgvEgAmTKICDRvTOsGYcGLsgcNf9YUpqAL9hbChsh9PoKB7RyzW
         arHx6FTU5Y0XNoAw0REN1ljTJGiXaRa8lD1aldCzOiQLsat5PNJcKaxYn3qO4u8qUgaT
         KPaQUcBN/Uza0o4Zy1SChXRIP6bEpGvjiLblibiwmfQh/qKYc6yJ+9YXbc/fzT3FbB9u
         6THhtoKNh2ZsiBNjNOVcviwmi6tEbjOWk+T0AojZdVQTULeA1dDk5QCVuDuEW0xkyYvn
         3Nb/6qRas9H9j/iIey2P9zz2MCssk62W4FziXkNTF2SCz6HTr0N9P9eNiRb8Oao9n5VH
         th7w==
X-Gm-Message-State: APuU4Z/hfWHD54uTn7xAd0+MypPVLYIkxzS5cV1KwyCPmE6p+NrbzBIj
	+hc/KWDjJ/RysbkCiE+SwlGsrmctGQm1mZabfdQGia25OzqwzgaDi8+sW2tDYHZUeO/gqoMEcwL
	zZkolptI+DD2omBUJ8tnDVA5v7tbT+BSpMzf690SJqkxzRjJZ8DTLEkoFXUYRnDe1
X-Gm-Gg: AZFdTZfvGuH+Y1eK2ou/4MMryTpskKbJHaLfHc6eHFvpfMDNba3WX4RNo1oIBY+wGlX
	GHhY7wJ1umjZhbaH+7dB7pU4IuHNVpQ+VNTKNEXtGETBgoJutcHlA7cmlkzdJ8+AifB2QRzP7BL
	XLXyPi2Dcr82z84SOX755iIIj7YzPMCEP38gJEGHcgFdLFQ7ax9sN18JLQhR+EWRp5XMpT5RND1
	BEyJIqT1u0UvoOSl0oQe8p0OPdBibYIs+1bAEDDrfpxtsFOxIc/leNmWOK2G5YkfDeXNEv7ll1A
	FWdnlhjH5DhWQlOHjU/c3LQXjcMDKPlO+0jl00VrSQEg8EjS3mkogQAQfgLJDWeiFZp8cMsrdOh
	qT9w73gkD0SojVgWf8yIf7TrOS+7Bxhgbv58ScKcMe3/xtXj3z7nBicmuPNIFlH0v4XyTrvc0zV
	022sZq6XpJxThFSjJ0SdERyjnD7egQ65G2qdKDMb65h0LW
X-Received: by 2002:a05:6a20:a10e:b0:3fb:2d3e:e602 with SMTP id adf61e73a8af0-4014db57a6bmr22570652637.33.1795683332039;
        Thu, 26 Nov 2026 00:55:32 -0800 (PST)
X-Received: by 2002:a05:6a20:a10e:b0:3fb:2d3e:e602 with SMTP id adf61e73a8af0-4014db57a6bmr22570632637.33.1795683331504;
        Thu, 26 Nov 2026 00:55:31 -0800 (PST)
Received: from [10.133.33.161] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872951febsm10293728b3a.14.2026.11.26.00.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 00:55:31 -0800 (PST)
Message-ID: <0bf1ebed-90fd-4f88-a5d8-e768d7278b12@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 16:55:28 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 3/7] wifi: ath12k: fix
 ath12k_mac_op_change_vif_links() for active-link updates
To: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
 <20261118025520.39269-4-miaoqing.pan@oss.qualcomm.com>
 <e5864418-b181-40b9-8718-2815d84d453e@oss.qualcomm.com>
Content-Language: en-US
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
In-Reply-To: <e5864418-b181-40b9-8718-2815d84d453e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNCBTYWx0ZWRfX6ECMTMYnM1MD
 UUE1zAYp8mh7rKoOpXjyCXhKyA5LXWrhJRHAC0z9ugs+MEViMPlkPSqaleAg9F3usoQffBfDG/D
 /PTkExSY5YG3Wg0wK8KVm28PLY79FO3Yqq4nLSgN+Nkhwa51o89NH/yngfzT/sgZ5VmzmUZvZS4
 MqytjVCHRDAHnrynA658sbzu/EmRIKk8IKTaVTs6vDf2aU/4LY1pb4ZwNEVa/vIku/i8ySKsiUt
 10DCCefaUtUm1x+aZ7/jXrimTNjYFmfpg4cjwYcZsNTPqASGzAOIeEp/qVLG3gGZpI6wca6XYNT
 foXd/gxATfW6K7sLBpbhY8H/58kbOCo2JpZHXengnWBjdKqGvHM2KJAKgbC+r9SJvXFDOmRw7hR
 G6qh3+MfARuvqyw3VOzf3lJ+DGJ1j1VvgMTLNVmeqq7XR87utKpueUvDFdwZSFyARdmHPDqawTH
 Swch/F4uE9YaPRA7NQg==
X-Proofpoint-GUID: ioU4miJS4vUW6N1QL1lwm4pKwChyCRNX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNCBTYWx0ZWRfX/f4fxCDw0sK8
 t9namlagASpnEiy9jbGzWk+mfnieOYouNW1dXI4Iyz+TXBJH+anmWRzP3mdivgw+NnN9GQK6g7P
 MWfwo7B0QFgITOu2jRN1Q/R2Y5mw9iY=
X-Proofpoint-ORIG-GUID: ioU4miJS4vUW6N1QL1lwm4pKwChyCRNX
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b07f404 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=lRClungnl63yzTEoqPgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_005533_409891_CF5B3211 
X-CRM114-Status: GOOD (  27.51  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/25/2026 5:19 AM, Rameshkumar Sundaram wrote:
> On 11/18/2026 8:25 AM, Miaoqing Pan wrote:
>> Currently, ath12k_mac_op_change_vif_links() derives the links to add and
>> remove from the old_links/new_links arguments: it creates a link vif
>> (arvif) for each link in ~old_links & new_links and frees the arvif of
>> each link in old_links & ~new_links.
>>
>> However, mac80211 invokes drv_change_vif_links() both when the valid
>> links change and when the active links change. In the first case
>> old_links/new_links are the valid links. In the second case they are
>> only the active links, while vif->valid_links is not modified. A link
>> that is deactivated is therefore reported as removed, although it is
>> still a valid link of the MLD.
>>
>> To fix this, derive the arvif lifetime from vif->valid_links, which
>> mac80211 updates before calling the driver and which an active-link
>> change leaves untouched. Create an arvif for each link in
>> valid_links & ~links_map and remove those in links_map & ~valid_links.
>> A link that is only deactivated keeps its arvif. On disconnect
>> (valid_links == 0) every remaining arvif is removed. The WARN_ON() for
>> adding a link that already has an arvif is dropped, since links already
>> in links_map are not selected for creation.
>>
>> Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00277- 
>> QCACOLSWPL_V1_TO_SILICONZ-1
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108- 
>> QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
>>
>> Fixes: 315d80be304a ("wifi: ath12k: allocate new links in 
>> change_vif_links()")
>> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
>> ---
>>   drivers/net/wireless/ath/ath12k/mac.c | 18 +++++++++---------
>>   1 file changed, 9 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/ 
>> wireless/ath/ath12k/mac.c
>> index 3f106ac6141c..28cb549b1f46 100644
>> --- a/drivers/net/wireless/ath/ath12k/mac.c
>> +++ b/drivers/net/wireless/ath/ath12k/mac.c
>> @@ -4377,9 +4377,8 @@ ath12k_mac_op_change_vif_links(struct 
>> ieee80211_hw *hw,
>>                      struct ieee80211_bss_conf 
>> *ol[IEEE80211_MLD_MAX_NUM_LINKS])
>>   {
>>       struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
>> -    unsigned long to_remove = old_links & ~new_links;
>> -    unsigned long to_add = ~old_links & new_links;
>>       struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
>> +    unsigned long to_remove, to_add;
>>       struct ath12k_link_vif *arvif;
>>       u8 link_id;
>> @@ -4389,14 +4388,15 @@ ath12k_mac_op_change_vif_links(struct 
>> ieee80211_hw *hw,
>>                  "mac vif link changed for MLD %pM old_links 0x%x 
>> new_links 0x%x\n",
>>                  vif->addr, old_links, new_links);
>> -    for_each_set_bit(link_id, &to_add, IEEE80211_MLD_MAX_NUM_LINKS) {
>> -        arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
>> -        /* mac80211 wants to add link but driver already has the
>> -         * link. This should not happen ideally.
>> -         */
>> -        if (WARN_ON(arvif))
>> -            return -EINVAL;
>> +    /*
>> +     * Link objects follow vif->valid_links, which mac80211 updates 
>> before
>> +     * calling us. old_links/new_links only describe the active links 
>> and
>> +     * must not be used to decide object lifetime.
>> +     */
> 
> This seems quite ambiguous from the mac80211 code flow,
> 
> Consider a 2-link STA associated with an AP, where one link is removed 
> by the AP:
> wlan0: MLO Reconfiguration: work: valid=0x3, removed=0x2
> 
> In ieee80211_ml_reconf_work(),
> Initially:
> valid_links = 0x3
> active_links = 0x3
> 
> ieee80211_set_active_links() first removes the link from active_links:
> valid_links = 0x3
> active_links = 0x1
> 
> This calls drv_change_vif_links() with 0x3 -> 0x1, but ath12k would not 
> remove the corresponding arvif/arsta since vif->valid_links is still 0x3.
> 
> Subsequently, ieee80211_vif_set_links() removes the link from valid_links:
> valid_links = 0x1
> active_links = 0x1
> 
> However, the call to drv_change_vif_links() uses:
> old_links & old_active
> new_links & sdata->vif.active_links
> 
> which evaluates to:
> 0x3 & 0x1 = 0x1
> 0x1 & 0x1 = 0x1
> Since old_links == new_links, drv_change_vif_links() returns without 
> calling the driver.
> 
> After this, mac80211 removes/frees its link object, while ath12k still 
> seems to retain the corresponding arvif/arsta. Is this expected?
> 

This is expected: with this patch, the arvif of a removed link is kept 
for the rest of the connection. It is not leaked. The vdev of that link 
is not deleted at that point because deleting the vdev of a single link 
of an ML association makes the firmware crash. When the connection is 
torn down, valid_links becomes 0. ath12k_mac_op_change_vif_links() then 
removes every arvif left in links_map, including the one of the removed 
link. The debug log shows mac remove link interface and vdev ... deleted 
for both vdevs.


