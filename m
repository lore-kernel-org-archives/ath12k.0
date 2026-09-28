Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC79CA5FA2
	for <ath12k@archiver.kernel.org>; Mon, 28 Sep 2026 18:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=10DfQ6Z2QM6w0dvQ2IWLX5tdv1brJzI5V2bGF0Z9WzY=; b=l0g0eu8O0/Q+Qv3qD6dGPPV5CK
	Ec1c0LOXOjOWV9o5F7NksLWTQdl4kEUinV46n3IEhabfbclIHsdt4/oWm7dJlqdCn4ndn+pRkwht+
	VdKRS7ZPiTtzWk6CKC+uIlzoyutR6DSeWfe6MxFUBaJXttQ8Aw7cNtFfFoLxNAhRASEGi8Db9JwVq
	BcxOcEYXd4HoLXum8V7wJZCd9L60bW2nfM9FsJmsyEdIodGB8sZGxNDvf22xqjF2FXcLCuSKsFfHL
	fe56JgDpZraGQbDocEycAMz2k5O5+p5aUL+JDKSjOE+8Is9gBmtrI3LbYZcCDhwdZk/6nx/NNExDg
	iUFtLzWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFlZ-00000001H3P-1gLV;
	Mon, 28 Sep 2026 18:07:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFlU-00000001H2M-3Ab8
	for ath12k@lists.infradead.org;
	Mon, 28 Sep 2026 18:07:49 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SHvlJN3304476
	for <ath12k@lists.infradead.org>; Mon, 28 Sep 2026 18:07:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	10DfQ6Z2QM6w0dvQ2IWLX5tdv1brJzI5V2bGF0Z9WzY=; b=UF4PHkYXxyKyuWg+
	YvrijZN9s4kTdVG+76g58Xf/qGGS4D+j4vM/RLAB0jZbcBEj5dsKI1Y/0VKhKEDY
	WATSKkaFlI6e9/p+U1e3lGER6B8scdLcWZiqgdodo9h9B0Jp3xMtpp5juNVArv8D
	4dyVvj/Sqdn2ltPNlHOXrqipoOHqDEJXai4iKruU5ow5YEYkz9OcmsObaXtpPnWv
	UyI7525NG58XratvJ9mtZ73ttkblrOqasB8N9zvfhrd4GUAgxKiiSb6beBci4bnj
	dBWxuaCBvfX5/fz5YSicpEMYmc9QAyXDbb16WzJhA9hhdfIySSWNYm9y4jr8vqFm
	TXcaEA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyj6t2x3v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 28 Sep 2026 18:07:48 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso5634603eec.1
        for <ath12k@lists.infradead.org>; Mon, 28 Sep 2026 11:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790618867; x=1791223667; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=10DfQ6Z2QM6w0dvQ2IWLX5tdv1brJzI5V2bGF0Z9WzY=;
        b=LrITZJlGiGXldtJXNeDChIHS9Jo4lmtRsKy+xeDK0XajrXwWqdKHSZCLPu9xunsTOP
         Ke4zPv+UUfJdwSmR2inNp/sNgslouIeru1B7F8dAjYVciwzGzI0CnmSleIOkN59DziMw
         VILzI/CpMXeOPHaF4EKXZZ/xZM+KXHp/ipsiuaPIhyH4TELMrdv4RRLz+0Bwcx9sJUOy
         o56jaTtUE7qgX5GzBQGzGtLDbAi3J2mi0Af5SZH6cvqJAr1EFTq2rbkxQEanbNCAaeag
         qslRcZMHhQ50ZpSnBWewR3trPGSnO86zjV4nuXDM8vpRiG/C3amZsBUBPHYmaVk772Ln
         LwGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790618867; x=1791223667;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=10DfQ6Z2QM6w0dvQ2IWLX5tdv1brJzI5V2bGF0Z9WzY=;
        b=fwiOruFk5lrdfMyet2Q16PU71l8aLrNpohZDCND/N/cVcq5p3XPFMDgwUEWRKuUonP
         uE3px2gXJbMWTzNsCl8QtDR2xW7Ezr2DEb0zUNEozGncT1yEiftBw0MbF5hl1CB0EqUu
         RXjUw+uPrdK6JhhdjaBhGjtYzhKwVGvpVnLluJP6hUZDF+Cq6D3WYekumSQOEzSFBokW
         B+1weTPSweH1PQXL/0DuOjHqnpQmY7SIufCsIC5xeDBM85/5I1x1crq72OFwAsy1xZGQ
         thXPkVFqzhTtr9YDr0c88MlufCt4hhuTubbovSIgH+I6qg68CkfvugmP2Sqr1uh0Qcd3
         Ce+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzAx8/1i5N+QIFVIrTe2WAGyFAsqsBzUPbgDSTAF6wW+SURl1FYXt9zzthEEzB5eHyunMuY/JM=@lists.infradead.org
X-Gm-Message-State: AFuF++kYlQ3h9oqbuBt6nSwbwJdWom7vM942IwzD2P9jdA6r7JlLUpYE
	XMm1sazuLAYXb9HNFCrknG8FyhCI/A8I98BV99vgSMh26THe2ORp2aY9RHyVdqqCjWzOCS6RylO
	KqbVnP9Vx7otMjz5fBfDIRogHYNOEoLdRdqW2BIMRJq9R8ADpZXPfM9gLPBWXZRIM
X-Gm-Gg: AYBFou0/9ZzTynZauTD/jQzhwn2uV6UBOGYdP1WWlB98kAZIQz6sqXIt6j9Bsz28+jq
	BK8p1WzlAjfe0TjcikYUmNUTxh5YoIUB9RyOMhhdHWf6rPl2VOTLdtkEAljRFwDQDyq6YhM2NyW
	YgkwtbxuW0+wP9PMwtKmp627JXIdyADfvlsmYFQrqFhb+VeVuMgP7y7EKfuMnhQN+fssIfAA9DO
	l85kXcjo2VJF+g372slHE6CLvvXGwBjnRojM6bbUG28WGEUbk4fJIH6J1DrpzCCcf/Z/rj4j+YZ
	/DR5yu4utx2IM43g6tlVdXhSqa7wwdlQL0TlZ2XmESLTRDtUNjMhrtPhjHQD6xeoPLEvVZZ03A8
	lmuwaRqlU/4OteouCeh+GtN+zK8j090vv9Ck3EG7ypntrFB9Jr4USIjjNCg==
X-Received: by 2002:a05:701b:2402:b0:14a:d8fe:3396 with SMTP id a92af1059eb24-14ad8fe36b4mr1226564c88.27.1790618867451;
        Mon, 28 Sep 2026 11:07:47 -0700 (PDT)
X-Received: by 2002:a05:701b:2402:b0:14a:d8fe:3396 with SMTP id a92af1059eb24-14ad8fe36b4mr1226519c88.27.1790618866728;
        Mon, 28 Sep 2026 11:07:46 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acd3d8eesm24802356c88.8.2026.09.28.11.07.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 11:07:46 -0700 (PDT)
Message-ID: <4af0fe72-4b55-47ff-91f3-06221e563231@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 11:07:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: assign device id from the WSI index
To: Benoit Masson <benoitm@perenite.com>,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        stable@vger.kernel.org, Jeff Johnson <jjohnson@kernel.org>
References: <3cd93e83-6103-457a-8879-bef8521bef9e@oss.qualcomm.com>
 <20260928154335.85628-1-yahoo@perenite.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260928154335.85628-1-yahoo@perenite.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA3MiBTYWx0ZWRfXyjdwp73w8mnx
 8KxmwdUoUF3svCkkxoWH5sPCu/uH8D/99QSXJ3Vs+NFlqXZwpNLEv6AGC8x/FIaEA37s1WXZi3Q
 GHve2sOFgXtQO1Ivkm2upbPZTgjaxKZ2hIfFfWPIeOtcHX7/ojVerfOD6F7zqzpYVp0sgZW7oJG
 NObT3WokhXy0vs3vnFZXWDbhnpWVYHynfp+Lqs1XnFUZrXuwZs3dJ7dngnz8uje6VsQfpG7hyS+
 a87nVYjTxBo+tCPOAjO2yO5iGNncrzqRT0Y3pvFIvEdbzUj/HtBYRBtZHqHFnmqZR5UlDIjqgEw
 JjZSIB7VOpJ2yfhjrlIUEwQY+eWb7ujJjhFs6yPN34bYmCzI9v48X/Mtp3fnVkDdjA5Fka9kmy/
 XbBIe1kA3O/O65hLTGcmwsqFRAEM1V7e9hzYxUwtMI8LvLNvyMBvrUhy7gHbdk02AoHgpt3d5ab
 PoDPJgCoczVDuoR2nsg==
X-Proofpoint-ORIG-GUID: IYLBppCZ97jjgEs0JZe9BXKADYBi7d_U
X-Authority-Analysis: v=2.4 cv=dZkVTnXe c=1 sm=1 tr=0 ts=6abaacf4 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=LV5C8B2hAAAA:8 a=33sO1Vo68oqyLtPrM3MA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=uiVh3g-rw18WZz7NjXbe:22
X-Proofpoint-GUID: IYLBppCZ97jjgEs0JZe9BXKADYBi7d_U
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA3MiBTYWx0ZWRfX7+afh8eBpq+K
 iAxnZWqEzWrcTVnegc4enKPNaiqH3AWIToaY1rkMp3q63q0gqfAl8VDQUbUdqEfgU6aXy43MdaO
 /RS9JsW6+JsPtV4AAxKhxYcOlmsQmHQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_110748_802558_6913CD93 
X-CRM114-Status: GOOD (  17.05  )
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

On 9/28/2026 8:43 AM, Benoit Masson wrote:
> Devices of a hardware group are added to ag->ab[] in PCI probe
> completion order (ab->device_id = ag->num_probed++). The wiphy radio
> array is built from ag->ab[] and the wiphy device is taken from its
> first entry, so the wiphy path and the radio index to band mapping
> change on every boot.

you don't describe why this is is a problem, and hence why it should be
considered for backporting to stable kernels.

> 
> Store each ab in ag->ab[] at its wsi_info.index, which is derived from
> the device tree WSI ring. The group order is then deterministic.
> ag->num_probed remains the group device counter. The unassign path is
> unchanged, it already indexes ag->ab[] by ab->device_id.
> 
> Verified on TP-Link Archer BE800 (three single-band radios in one
> group): the wiphy path and the radio index to band mapping are
> identical across cold boots.
> 
> Fixes: 6f245ea0ec6c ("wifi: ath12k: introduce device group abstraction")
> Cc: stable@vger.kernel.org # 6.14+
> Signed-off-by: Benoit Masson <yahoo@perenite.com>

SOB doesn't match your From address. So you either need to change your SOB,
update your From address in your e-mail agent, or add a From: tag to you patch
so that From == SOB

> ---
> Changes in v2:
> - Set ab->device_id from wsi_info.index in ath12k_core_hw_group_assign()
>   instead of reordering pdev_map[] in ath12k_mac_allocate(), as suggested
>   by Rameshkumar. mac.c is no longer modified.

your e-mail subject doesn't reflect that this is a v2, and it was threaded
instead of being sent as a separate e-mail thread.

when you send a v3 that addresses the above please make sure to use a properly
versioned subject and send as a separate thread.

Thanks
/jeff


