Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB2EBC27C6E
	for <ath12k@archiver.kernel.org>; Thu, 13 Jun 2024 06:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gvK+hAuqG6Ti1m5FJza3xDGGgxrF8FLGdkg5spx+nR0=; b=td9EJkvpNMeYeh0arx4mzzRgN0
	MHzB7CJtGOu6ZntBBquGY/B2qzoGl7X9h8rEtrImpn2PMNZdQUDuqX6bXV07X6JxaNo9vNVJo1huP
	AU1Lnxx0b9rwVY2vA1DfMxI53nK+4Ro7feHUmya8z6feITB5MBxiHmXCc+liZSFKZKurcaLM8DJc+
	xQPaizSS+O79MjQlq8J2dFVBZVPZDUSKK1n75KI07kgfUO5laCvfR3CQl9a+2H2bgQQ8VMHFXex+w
	YO0qRnTM9cauf7Sbk894lHQ+PiWWA2u4zFOWiN8lKHGG6JV9cw6mtGgjUA+ZJVQ2G8Bv1DOuD2asA
	CHXdk3wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHdgQ-0000000FFng-0qJP
	for ath12k@archiver.kernel.org;
	Thu, 13 Jun 2024 06:11:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHdgN-0000000FFn7-3usJ
	for ath12k@lists.infradead.org;
	Thu, 13 Jun 2024 06:11:37 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45CKnIQi022423;
	Thu, 13 Jun 2024 06:11:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gvK+hAuqG6Ti1m5FJza3xDGGgxrF8FLGdkg5spx+nR0=; b=ZUBJ6NVm2EsddVi/
	vh1ZFEDafAoPGuWJK34W5fcopvusRxjkr5OYswvdJY8KsYJPgzsQQEW8Cx+Xbsig
	MfirB2eTruKGldr8nqxR2hjMaDPLgrA97FrBMXzuxxqcERfDhvmpkiM3dn6tHiJ4
	3/NB3dV4jan43mQsX3AunGcKGg28puXnNBGN0cEg3wo5WZ/Tc5ugyE1Hs/Bz8VSm
	ga3su11hX84V/Q41yd7CxHtkvWS4xhVOrowoahPnJhR4uvRizRSEwpE5Lrmm8zAP
	AUQDOKKcWVjetGeJ1WPoguXZvpxAaxkSoOispNMK5sOGPxXXUsKX2p17NKWSeAtx
	UQbCTw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yq4s8kdt7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 06:11:32 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45D6BVR7021952
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 06:11:31 GMT
Received: from [10.152.193.243] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Jun
 2024 23:11:30 -0700
Message-ID: <d0b39e0e-62e9-468a-b235-b4cb77a80c9f@quicinc.com>
Date: Thu, 13 Jun 2024 11:41:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Fix WARN_ON during firmware crash in
 split-phy
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240529034405.2863150-1-quic_aarasahu@quicinc.com>
 <87v82goha4.fsf@kernel.org>
 <5b3c9394-bac8-4f94-9af8-686a76a3726b@quicinc.com>
 <87a5jpnzo3.fsf@kernel.org>
Content-Language: en-US
From: Aaradhana Sahu <quic_aarasahu@quicinc.com>
In-Reply-To: <87a5jpnzo3.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: nA5rKTn5kEdlKTmPFqMX9YgDlA5Z6Lop
X-Proofpoint-ORIG-GUID: nA5rKTn5kEdlKTmPFqMX9YgDlA5Z6Lop
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_12,2024-06-13_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 spamscore=0 mlxscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=830 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406130042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_231136_015736_C7C47492 
X-CRM114-Status: GOOD (  11.38  )
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



On 6/13/2024 11:37 AM, Kalle Valo wrote:
> Aaradhana Sahu <quic_aarasahu@quicinc.com> writes:
> 
>> On 6/10/2024 10:40 PM, Kalle Valo wrote:
>>> Aaradhana Sahu <quic_aarasahu@quicinc.com> writes:
>>>
>>>> Whenever firmware is crashed in split-phy below WARN_ON triggered:
>>>>
>>>> ? __warn+0x7b/0x1a0
>>>> ? drv_stop+0x1eb/0x210 [mac80211]
>>>> ? report_bug+0x10b/0x200
>>>> ? handle_bug+0x3f/0x70
>>>> ? exc_invalid_op+0x13/0x60
>>>> ? asm_exc_invalid_op+0x16/0x20
>>>> ? drv_stop+0x1eb/0x210 [mac80211]
>>>> ieee80211_do_stop+0x5ba/0x850 [mac80211]
>>>> ieee80211_stop+0x51/0x180 [mac80211]
>>>> __dev_close_many+0xb3/0x130
>>>> dev_close_many+0xa3/0x180
>>>> ? lock_release+0xde/0x420
>>>> dev_close.part.147+0x5f/0xa0
>>>> cfg80211_shutdown_all_interfaces+0x44/0xe0 [cfg80211]
>>>> ieee80211_restart_work+0xf9/0x130 [mac80211]
>>>> process_scheduled_works+0x377/0x6f0
>>>
>>> This is just the stack trace, not the full warning. If you send me the
>>> full warning I can add it to the commit message. Also it would be always
>>> good to identify what warning it is exactly as line numbers can change
>>> etc.
>>>
>>
>> Sure, the full warning is given below:
>>
>> [ 364.713223] WARNING: CPU: 3 PID: 82 at net/mac80211/driver-ops.c:41
>> drv_stop+0xac/0xbc
>> [  364.716875] Modules linked in: ath12k qmi_helpers
>> [ 364.724598] CPU: 3 PID: 82 Comm: kworker/3:2 Tainted: G D W
>> 6.9.0-next-20240520-00113-gd981a3784e15 #39
>> [  364.729378] Hardware name: Qualcomm Technologies, Inc. IPQ9574/AP-AL02-C9 (DT)
>> [  364.739965] Workqueue: events_freezable ieee80211_restart_work
>> [  364.747082] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> [  364.752897] pc : drv_stop+0xac/0xbc
>> [  364.759752] lr : ieee80211_stop_device+0x54/0x64
>> [  364.763226] sp : ffff8000848dbb20
>> [  364.768085] x29: ffff8000848dbb20 x28: 0000000000000790 x27: ffff000014d78900
>> [  364.771301] x26: ffff000014d791f8 x25: ffff000007f0d9b0 x24: 0000000000000018
>> [  364.778419] x23: 0000000000000001 x22: 0000000000000000 x21: ffff000014d78e10
>> [  364.785537] x20: ffff800081dc0000 x19: ffff000014d78900 x18: ffffffffffffffff
>> [  364.792655] x17: ffff7fffbca84000 x16: ffff800083fe0000 x15: ffff800081dc0b48
>> [  364.799774] x14: 0000000000000076 x13: 0000000000000076 x12: 0000000000000001
>> [  364.806892] x11: 0000000000000000 x10: 0000000000000a60 x9 : ffff8000848db980
>> [  364.814009] x8 : ffff000000dddfc0 x7 : 0000000000000400 x6 : ffff800083b012d8
>> [  364.821128] x5 : ffff800083b012d8 x4 : 0000000000000000 x3 : ffff000014d78398
>> [  364.828246] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff000014d78900
>> [  364.835364] Call trace:
>> [  364.842478]  drv_stop+0xac/0xbc
>> [  364.844734]  ieee80211_stop_device+0x54/0x64
>> [  364.847860]  ieee80211_do_stop+0x5a0/0x790
>> [  364.852375]  ieee80211_stop+0x4c/0x178
>> [  364.856280]  __dev_close_many+0xb0/0x150
>> [  364.860014]  dev_close_many+0x88/0x130
>> [  364.864092]  dev_close.part.171+0x44/0x74
>> [  364.867653]  dev_close+0x1c/0x28
>> [  364.871732]  cfg80211_shutdown_all_interfaces+0x44/0xfc
>> [  364.875031]  ieee80211_restart_work+0xfc/0x14c
>> [  364.879979]  process_scheduled_works+0x18c/0x2dc
>> [  364.884494]  worker_thread+0x13c/0x314
>> [  364.889266]  kthread+0x118/0x124
>> [  364.892825]  ret_from_fork+0x10/0x20
>> [  364.896211] ---[ end trace 0000000000000000 ]---
> 
> Thanks, so I assume it's this check from drv_stop():
> 
> 	if (WARN_ON(!local->started))
> 		return;
> 

Yes.

