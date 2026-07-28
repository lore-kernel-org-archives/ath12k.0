Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8910EC54F4C
	for <ath12k@archiver.kernel.org>; Tue, 28 Jul 2026 12:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6FFanSBczPsLjF78bY4RBzFH+P5Yq2LeBNt7fkvw74M=; b=UaqY0adP80PRTEAGZ/nnuBqKOo
	4eB3JBMsWMMju4aX9m+g4K/VpJxEs2bKHHL/3OeW6afer8dx7BOg1rN9waQXYzv5d7MUVQjRNEu7Q
	h44MwwVyc/Kd4MHkJ1CYZa6CQzVKwpWtTv1V36VEP/2TrpCPcnX88mjlCxBZKUZ4jHhZgin/KXEV7
	RJe/gsJYsLUDGFCd+EpjP2Djo7fyRl2SJnp8sK/WqjSXB9K9bhVmg5GSAGHEeHlMNO9+YEbCcBPL0
	11hWeHPFncpiIHTOkvEJ8pK9bUv1rh4sdslA640guS50RHT9OygxzJ57x2Y+SWpV3MKTLke8VS6s9
	rtZemjlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogpz-00000005E9u-0pF7;
	Tue, 28 Jul 2026 12:23:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogpx-00000005E9Z-0U2q
	for ath12k@lists.infradead.org;
	Tue, 28 Jul 2026 12:23:10 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SBIAPr2735026
	for <ath12k@lists.infradead.org>; Tue, 28 Jul 2026 12:23:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6FFanSBczPsLjF78bY4RBzFH+P5Yq2LeBNt7fkvw74M=; b=JZXoU65HhcMKXEO2
	Gej3LaAcMBSmgaEBEgTXFPO/dyFz+r5mIRqGWafkrTdkFO+kenX7JS886h38pFvY
	cInIWYHbtTj9DmlHGRaVZpLTfhxABDc0z7lMwh6E1F5iHxLrz59VLNecbz+ON5y2
	ytwRNBGzYkaXl5jTkyknROx8Ig9oMxDuj/PW4zpJl7MHQuC5twYAvSIlxw6lr+UE
	4zMRJ5TDAhXb5DXx0+FffCIVNkbW5pLcdOvrCdl80esirHpkKLufZc5wFQl2sPcl
	Dx+2Y4Odoc0vbreJ1skDYwYvpXADaB2v0MVgEL3vuolSfmisG0EvSSk3C4xWzO5W
	zMJB1A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbrsv66u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 28 Jul 2026 12:23:06 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e2f61c09dso5286544a91.2
        for <ath12k@lists.infradead.org>; Tue, 28 Jul 2026 05:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785241386; x=1785846186; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6FFanSBczPsLjF78bY4RBzFH+P5Yq2LeBNt7fkvw74M=;
        b=c75/ivPW+gP1zKL8MfBCRhmAxiz99vFvMJq2Qx4v+A6l3Rh922gG2mStnHPk1tv4mT
         HL47NzZC11rMe/HANpfyGgrhx6/Rv9yRlt4FArUJ0xms0Oss72ogQFkUg+7noR146akl
         4JvzMT25/kIz7hq1im0OEQ2BJAVAuvbNLNFij/TGXXDENsWuOjX+R+ivOpogjuzp8eyP
         xTZqWdO7MKumBzjuFF5qVXmwK9FgCCMGdyXSSyKwerEBiXvbDWZnbjsJ/3PkPRyPIeZL
         p+HvkY4NxEIxDM65mpqgtyMneotzGxA38ValCQ2dDmsmI+IxHMIVWBqkWyoM04nNPA3f
         OAKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785241386; x=1785846186;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6FFanSBczPsLjF78bY4RBzFH+P5Yq2LeBNt7fkvw74M=;
        b=B/oSHu+PbFBYsRyNNdTUId0HEgm6Rqjc9O+Xjj/DYxnkcuQUY5abkwlBV/prryd3cJ
         k33Q0Q4Kg9zKDJFXDo2JH8dP3H6n76RTdnofB9uCnjDbr2tb7ObdAQiH11Kn92GHylcP
         ZPj8oc8KsV4AWTSCqQOfxdGvEKDfP6FbECxmlCE/EUgId508BpSTNcQLf/qVXpNStQ9U
         8edbhttvIRKXaH4Yxf5akgvfTsqXlO4XUyWXREAUntL739CpqWVmZXqb/eUoUghwrRRG
         nTqHrlqI/SFq8fwaUjau0+XzPR5Ve0FJCc5DRAZ0Ecz7cV/XtBbPbzXu/1bE0bbyXOJF
         z88Q==
X-Forwarded-Encrypted: i=1; AHgh+RpAgodKB70KIMDlOVHiupAqLiX6eD2i3mh0xzClGRtW0jjB9QXZACpiT24aT7XftZcyaoX8L2E=@lists.infradead.org
X-Gm-Message-State: AOJu0YxDTZv+VQUC9SI5sDpT7NEkYqIQ69EabKh3ckEMmRitU92LO26B
	yb3uPeeFFX1iIhdfKRgs9LZE/YWQkAL2DdYT3veg5HQQaIjVZPsPNAnupF9dLyFIQFYx2Lpzy3d
	5dn91vSfQzWh+sZob3OciugB7j+7RnkIa/S83UT3zoKW3u+SUeKzSlZ/AaeVMmT0/
X-Gm-Gg: AR+sD11tdKhuJUlrp64haWaJ9mOtMEqXFO2uEIU/k6GX2/P19bx0YkCUPtHQ/46FZ3w
	/Hbkw/R/JHbQ+MImcBQqdmCWB8nQJAdtRXvXz92Ux4HBKU1XNRZpQhcQuskX60Qny3bYRxq5bRt
	f1Vt+5vDw0bJRKs7PttUJg5KsGTJ0dYamQoW/oqDhn2OafvsbJshZTvAX1VXXWN/Yd/GZyW67l6
	al4jwACFDpMrpMIPk8pAAMzepwQQ6XJ+/Bg7AYQBM8iFJlOWoc65h1eaJ4syeL6vdrp+F05opvd
	RIdiugJClAd9HJ/5C8+gkMqrWcpWBf15GQGPTbTU/t4J+Ioc/m3kDHWUdP8t9PSuE45hJ6f4p/d
	dn9t8ojL9nVs49btM4ZNiYjje3xYJ8sQ=
X-Received: by 2002:a17:90b:5864:b0:38e:c7b0:84ad with SMTP id 98e67ed59e1d1-38f6a1becc7mr2303001a91.0.1785241385815;
        Tue, 28 Jul 2026 05:23:05 -0700 (PDT)
X-Received: by 2002:a17:90b:5864:b0:38e:c7b0:84ad with SMTP id 98e67ed59e1d1-38f6a1becc7mr2302973a91.0.1785241385301;
        Tue, 28 Jul 2026 05:23:05 -0700 (PDT)
Received: from [192.168.0.12] ([49.207.202.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f641053cfsm1218175a91.3.2026.07.28.05.22.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 05:23:04 -0700 (PDT)
Message-ID: <3d740be9-282b-494d-ac2b-bacde92a051b@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 17:52:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 5/8] wifi: ath12k: add WBM RX error drop
 statistics
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aniruddha Mishra <aniruddha.mishra@oss.qualcomm.com>
References: <20260723125448.922361-1-pardeep.kaur@oss.qualcomm.com>
 <20260723125448.922361-6-pardeep.kaur@oss.qualcomm.com>
 <49f52ca6-d2a5-41d4-9952-794dae91e32f@oss.qualcomm.com>
Content-Language: en-US
From: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>
In-Reply-To: <49f52ca6-d2a5-41d4-9952-794dae91e32f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEwOSBTYWx0ZWRfX5jEK1Txh/Vin
 J/etE6ccBdxN7dHi3bjDmfv+roq7wCwO/SycK6e5pKrrvAfjR9fk7qPHqKoBC1qZFsK9Se2iFh2
 rzwRJVlRWUvR72Q8iGvsR6sxSM8hVChz2V5A3zSyci3STOYPPlqELg1cJLeZW07INt3csD/U11k
 AHbeWX0+WJKv15BsR8UtF+Zv0pYwDrUeCnpCTrVcn51spPRvAe88c2BlyA+kt8oiEE7L4X03ZCK
 JLvo0aGnWkeX+fTRHltc+/DXDUcP7JdHtlY6CfnmXPWvc2mFxqCbJuxOZ4JmhbhtFw+9uHSKtSq
 oqz/tPU/s/jP5T4MKQtWniu22pqH7jkwM5x6jMnSei9mfWqkWJgZEonSmQmZpbNo9Nbsd6Kph36
 MIIGorw9YhglscsXowcODDnhDkVwwu3AfKVngnmsvyyLk/p7wGDeSkKz7oJreY2ALcroprdIZ5Y
 HnQtUOjMcwuUb77493w==
X-Proofpoint-ORIG-GUID: -Ex6Ta2FGa9viq20PKi_F8JyBR3XOm3n
X-Proofpoint-GUID: -Ex6Ta2FGa9viq20PKi_F8JyBR3XOm3n
X-Authority-Analysis: v=2.4 cv=ALkdLnG8 c=1 sm=1 tr=0 ts=6a689f2a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=wDio1FLaKedB3uI5tWxtsQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=qMQjmZDiIxJzO8nyjRUA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEwOSBTYWx0ZWRfX/NVoKIRrKeaG
 +7unHIJyzGf2oKhx/88ea6Btcx77xkp82ODEAlCm5xNGz2I2seHyJqzT9mDyJdDSSjeLALdkAQ/
 XdjdVWaHRqSuLtc2Qqffc1GZc7khKlU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_052309_273969_5118152B 
X-CRM114-Status: GOOD (  13.34  )
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


On 26-07-2026 21:30, Jeff Johnson wrote:
> On 7/23/2026 5:54 AM, Pardeep Kaur wrote:
>> @@ -1961,7 +1983,8 @@ int ath12k_wifi7_dp_rx_process_wbm_err(struct ath12k_dp *dp,
>>   		device_id = desc_info->device_id;
>>   		partner_dp = ath12k_dp_hw_grp_to_dp(dp_hw_grp, device_id);
>>   		if (unlikely(!partner_dp)) {
>> -			dev_kfree_skb_any(msdu);
>> +			ath12k_wifi7_dp_rx_wbm_err_free_skb(dp, msdu,
>> +							    WBM_ERR_DROP_NULL_PRTNR_DP);
>>   
>>   			/* In any case continuation bit is set
>>   			 * in the previous record, cleanup scatter_msdu_list
> My review agent flagged that between the blob above and the blob below is the
> following code that drops an skb without accounting:
>
> 		if (err_info.push_reason !=
> 		    HAL_REO_DEST_RING_PUSH_REASON_ERR_DETECTED) {
> 			dev_kfree_skb_any(msdu);
> 			continue;
> 		}
>
> Should this be counted?
This one was not handled as part of the current patch incremental patch 
will handle this
>
>> @@ -2007,7 +2030,8 @@ int ath12k_wifi7_dp_rx_process_wbm_err(struct ath12k_dp *dp,
>>   		hw_link_id = ath12k_dp_rx_get_msdu_src_link(partner_dp->hal,
>>   							    msdu_data);
>>   		if (hw_link_id >= ATH12K_GROUP_MAX_RADIO) {
>> -			dev_kfree_skb_any(msdu);
>> +			ath12k_wifi7_dp_rx_wbm_err_free_skb(dp, msdu,
>> +							    WBM_ERR_DROP_INV_HW_ID);
>>   
>>   			/* In any case continuation bit is set
>>   			 * in the previous record, cleanup scatter_msdu_list

