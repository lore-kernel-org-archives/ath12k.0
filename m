Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C628CC369DC
	for <ath12k@archiver.kernel.org>; Tue, 29 Apr 2025 14:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=101iQVq/5J/MuRjI8xN5yS8V9vTfuEeQBhotIUnXp6o=; b=CR+yxf7qzGHYOBlDAqTVTfbAIO
	EWSFB/QLxoPrlopaO8+q5J5QDdbV95xrQqFbcaP5R8PUwgvBIIjb0Hbm0gkc2UhJD5fgr8odOfI3o
	uL+QrsMOieKYbBZBkm98jhD0FsYqljaFanZ1shBuLAq0QzpxT1slNsANUqdJt6NzSvsATkj2QEUXy
	2NX74Lhf+lTFh30IcsGYYaV40WYpmZVu09gECbd1ti8sb3/xKjOi7K9P8M834Eju9ntX5ODTHUew6
	uxgsZjau7PzvM0fdme0VDFxsuYopuHCVsu0WgVVVTY0alMUUSXn+z9tCoDA/YOLp3OTHj3MNBU1ko
	+cTNfqYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9lhw-00000009s4f-1Mgv;
	Tue, 29 Apr 2025 14:13:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9kH1-00000009fec-3USK
	for ath12k@lists.infradead.org;
	Tue, 29 Apr 2025 12:41:21 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TA1Bd7015407;
	Tue, 29 Apr 2025 12:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	101iQVq/5J/MuRjI8xN5yS8V9vTfuEeQBhotIUnXp6o=; b=nkSJBQ3t6g2maRdH
	XZG+cdb6B2ZMiSEudJiA4Vh67R9q3ny9NTtDJEFcFj0g+GnsoXaaIbCq7ILEFui6
	evrsxH7sIen0iE3eVEq6eI6/kldTUlKSgsXi3clo/ca2S9p3SrgVdCPZr0ZKMk96
	B74467/dljCEd7xawPVlBkL68x4qQKOB3vMGjcK1shNKnFu2tZwbJN+2tQYmk9VC
	PqGY6oyEkLHdG8uEZ9v5688gP1OR/DAlk9XTAnYirmWW9U3mQcqr/csMkISxzTgw
	CXE/3JrrU+/HxJptAOf9OpZN0hyBVVybKivdXWIW+tVh5lRs7CJKbLoyU6aTvbDZ
	dLDUxg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qjwvh67-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 12:41:17 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53TCfG8c017190
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 12:41:16 GMT
Received: from [10.216.33.157] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Apr
 2025 05:41:15 -0700
Message-ID: <28403304-bb8c-432b-9130-40af69bf8c66@quicinc.com>
Date: Tue, 29 Apr 2025 18:11:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 1/2] wifi: ath12k: Reorder and relocate the
 release of resources in ath12k_core_deinit()
To: Yingying Tang <quic_yintang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250423055650.16230-1-quic_yintang@quicinc.com>
 <20250423055650.16230-2-quic_yintang@quicinc.com>
Content-Language: en-US
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
In-Reply-To: <20250423055650.16230-2-quic_yintang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: xbQNKI0vgqPKktPTpLhhtD5pfLLwPZiM
X-Proofpoint-GUID: xbQNKI0vgqPKktPTpLhhtD5pfLLwPZiM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA5NSBTYWx0ZWRfXxrMSiqaf4uTG fnMlcxAYsFcuWwvec8hPadxaMJZpHBRc3vbKTGzpBokS0Ox+qunrQU5XzvwSUE21iPMBBIgr1LD S0U/PNeW0HPErnadijQzCaN20FmmGkbRpb7GJnI6oobKDeParZEF57riR//gVZ6RZgG9MSVY5qF
 IY2kRg8MkEm0HNtLU87/TwM0aWeXav6ITgkMsyGID8FHA6v7mjHCp0EBwY62Co2U1TxF0qcLcuv IUbHv+RQV5xnSR0KIgMDTyjosOyan3Xlb5iNFxpPgY7O74QaCiNorH9wjhQQ9a3wVCkDRQOAzwK jgto6mTiSDNNIo7XmEzO1ZXMtVteVzAZJGwiLfeVFDB3G0QDyuSvoBPyDszOHiS46guhczmXP7R
 mSJribXfcouIZxvEppqzlYEi8cYO0mfVWwdekUMWoDlgky7Yjh1YBcRFTc9+F/9TR5vvFyl/
X-Authority-Analysis: v=2.4 cv=c/urQQ9l c=1 sm=1 tr=0 ts=6810c8ed cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=1n_hH0Y3tB8GNVd_w_QA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=459
 phishscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_054120_007360_67B2F759 
X-CRM114-Status: GOOD (  11.23  )
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

On 4/23/2025 11:26 AM, Yingying Tang wrote:
> Ath12k panic notifier is registered in driver loading process. But it is not
> unregistered if ATH12K_FLAG_QMI_FAIL is set(e.g. load BDF failed) and unload
> driver. It causes a dirty node in panic notifier list since ath12k panic
> notifier is not unregistered from list but the buffer of this node is freed
> in driver unloading process. If load driver again there will be a page fault
> error due to this dirty node in panic notifier list.
> 
> This issue is caused by asymmetry between ath12k_core_init() and
> ath12k_core_deinit(). Reorder and relocate the release of resources in
> ath12k_core_deinit() to avoid this asymmetry issue.
> 
> Call Trace:
> <TASK>
> ? show_regs+0x67/0x70
> ? __die_body+0x20/0x70
> ? __die+0x2b/0x40
> ? page_fault_oops+0x15d/0x500
> ? search_bpf_extables+0x63/0x90
> ? notifier_chain_register+0x21/0xe0
> ? search_exception_tables+0x5f/0x70
> ? kernelmode_fixup_or_oops.isra.0+0x61/0x80
> ? __bad_area_nosemaphore+0x179/0x240
> ? bad_area_nosemaphore+0x16/0x20
> ? do_user_addr_fault+0x312/0x7f0
> ? prb_read_valid+0x1c/0x30
> ? exc_page_fault+0x78/0x180
> ? asm_exc_page_fault+0x27/0x30
> ? notifier_chain_register+0x21/0xe0
> ? notifier_chain_register+0x55/0xe0
> atomic_notifier_chain_register+0x2c/0x50
> ath12k_core_init+0x7e/0x110 [ath12k]
> ath12k_pci_probe+0xaba/0xba0 [ath12k]
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0-02903-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN8750 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

I guess this Tested-on tag should be
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Not sure if this can be taken care while merging in pending branch? or re-spin is
required?

