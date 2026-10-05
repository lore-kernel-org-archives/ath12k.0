Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0D5CA5FF0
	for <ath12k@archiver.kernel.org>; Mon,  5 Oct 2026 18:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bnQOTfjQ6wqdqHn/qVQ77fhq7el1lDrRBmqVerTW1VY=; b=lGikIkHP7ctxl7HQdZ7f0wbevH
	u0JNWsIZI5A4gYTCwRGS16JNCYbtTMFXxzzMsm8vMfyYEazq/GrnG23t7dyMHZac68CI+CJ7YBmRF
	MJAwKX48Jyps9sqepnpbudtdfZHQ8C1BRUQ6jU31V5DTJ3Xd3vrUaZJnvl1PNyCum6rZNO6gt2xKB
	V82wZsVvqCCFm815QEr2rX9mTajcV8X6Blrf6yB0Q6sTEvzfo25jYiTsRO5OpgF3P8668hsjEJYxU
	iGqtrSw9QU/YVk6xDIva7waX9+JCzezTKbrI8O86oMGwxRijtHfz8Gn2LnOr7FNSMP07xvSphM0RC
	lgs4R36A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDnC5-0000000Gz2C-21CF;
	Mon, 05 Oct 2026 18:13:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDnC3-0000000Gz1n-0NGI
	for ath12k@lists.infradead.org;
	Mon, 05 Oct 2026 18:13:44 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695HuS7F2484462
	for <ath12k@lists.infradead.org>; Mon, 5 Oct 2026 18:13:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bnQOTfjQ6wqdqHn/qVQ77fhq7el1lDrRBmqVerTW1VY=; b=lbTlvuu0NdEsEw1S
	i3QudmlK+pydVwMAnOUdx3NkB9vu/bPKYn3griO94HOsGoLYOWTfeqaOoJ9IEU/o
	Gvhr7ALskX0TpTzZzToY3G10L1251TKUiXJG8EM3NBNZS/xLe7Hv4+ACxFA9EYmw
	6jwUqliSCAZn6IIYZNG5RE/uCBD4xiIweL97udm7YNHX+KmJaMIvQuP+sqfGbCFV
	jFdG+HzJul9QvzWFimv32Uekz1D9OzONPm55L4v10KAVpjuV5PjXXFVFxoaI8JnT
	BxDYVRcXaQQVglWsWQRr9csougou+p6Vcl8OsXFVsxBWzfPS4jikr4nYtkw5CRN9
	z7oOHw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4gr0829y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 05 Oct 2026 18:13:42 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39de4e72b33so2806647a91.2
        for <ath12k@lists.infradead.org>; Mon, 05 Oct 2026 11:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791224021; x=1791828821; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bnQOTfjQ6wqdqHn/qVQ77fhq7el1lDrRBmqVerTW1VY=;
        b=f7WAqFtucY+cGSGOrCe6r26cJ6AtmwSDylebuGvKqmHZcVc26BFjf0U0NNf3xkhSZ9
         RqgBVtL/2eSd31CC/NjxTPVcEIowzGE7tfP7XOZStVHTwP3sLedCxjPiJXy4qcNgO7oG
         f/8a62a0RuIpKuuEUDMJye6dZixX+Ey8sAU67eyIF6kMspkID1bq1EsCzWrpvy5eFKqd
         oMQ37AkMKIeEpRgAcX+RAxJz9ZSOGub8BIS1wkJoV9wniTerBiR9TLBFQQalm4xtlD9B
         RiViaUlJcASLydu2rJ/Vuf8ZYNNNozzBJF1VmIpmXI5Uo0j8uoNRM5Ksd0MJGHvJ7iDL
         r/5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791224021; x=1791828821;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bnQOTfjQ6wqdqHn/qVQ77fhq7el1lDrRBmqVerTW1VY=;
        b=aUOeDQa1yp2G1iex5BiGGh4+CK//JODnp0g4ruRSFQUfbz44b0cGxpVtRSmoWkUt4n
         oJlplvtPic7BQzABczYpS9tVg/46DLFF40BcYriUzKDETIjZebnAWPdkP22WPRqhokqd
         NJPTFbWYUGb52Vuuq/N5JAlnJwNu9wTU4ooqRqSQ2T1Zw/9nF98+feaV40BDUog2/SGC
         2kuB0IIhjMP4lqag+xr0osDDadXlnBtUIO2UPrVfr3R0kNav99f/hnj7NEsDfT8vclm3
         Xx/Vh7gb6zwSm19bHtvmezsr5ef03URrgA1VV0P8PMZxEZg1A92KXytLUOJ/N82CZR/R
         e6rA==
X-Forwarded-Encrypted: i=1; AKwUvBxsVMNIWArvC10umi24GpgI+NPy6OaN+TTT5ZylQR0cmym6rpafAkWRrybpGrmzY1gEFKaTzrw=@lists.infradead.org
X-Gm-Message-State: AFq9FYJrGVPj+0Mcpmompj5Hdp9fpAG8n419N75izdjvXMUOkLyZvfO8
	ioLtt86x66fdMOiPnK9Ms+0jJ95aCyZluMWzzPJV2nr1oI9duocCY26IRXiyiXryzw86T2MtcDM
	DdcNdQKDQIvBCEke+R6H6Ab2+PE8PK/qZp9XHxCJOZvtoEgpk4G36bKSnzz8JUaTkxolZgja+
X-Gm-Gg: AYBFou2yZF1rlByd413o6DuEolAm1X4YUNWxwJBJtHA7Zrg1ukk7SLDHccYCSCg0DRT
	8Iw7EttUZBEYHbjRqgmnS34T85GEda9APlHgwVoK61t1GhFov53V0nmbyWbdPjglrkgbE/uJgrO
	LPH7IWaX16cc1+SQiDSQkDib9WdMMpuHDo5Xj3orICg+3cT1Apkcou/xX9/GA1R9bP9NWDV+gLy
	OBc3BJGd4pQ23jRiIHHsBI30IMa63WZOQAyGX3k19QDvhNkKACnZ7X4WiJoXnmhZsivqtrzcEtb
	vW4zIOne5oMT9uJaBrGCi1XxQ0Pf6gVV1RVlp9/b4HOpAHCrIsHzPWwusnb4Nke/HXCe0UOeVEo
	ZAZGmOrqmSvx3IY6hwPnDDUID0fw1h+ia6lhGfbgQsGDww0vDg3wjn9br4Q==
X-Received: by 2002:a17:90b:270d:b0:3a4:97ea:f0d8 with SMTP id 98e67ed59e1d1-3a6ced37137mr10882915a91.51.1791224020933;
        Mon, 05 Oct 2026 11:13:40 -0700 (PDT)
X-Received: by 2002:a17:90b:270d:b0:3a4:97ea:f0d8 with SMTP id 98e67ed59e1d1-3a6ced37137mr10882884a91.51.1791224020329;
        Mon, 05 Oct 2026 11:13:40 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a854257d18sm646373a91.7.2026.10.05.11.13.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 11:13:39 -0700 (PDT)
Message-ID: <f8284643-64ff-4f58-88c6-8d7a9669c5df@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 11:13:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] Revert "wifi: ath12k: add panic handler"
To: Yingying Tang <yingying.tang@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, yintang@qti.qualcomm.com
References: <20260612032332.2278338-1-yingying.tang@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260612032332.2278338-1-yingying.tang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA3MSBTYWx0ZWRfX0XPRkeToaS3l
 nGKo5kjyY8WOIN0Xswd+sp2gaU/pIaRn1dE0j2gZAsW+7vsibm+8sizvcMAtUbAH0nivqiqYvyz
 qPgBJA+/jQId6zaNsX+rJ1gDwPSIIyH8n7H+ZoHfgM52ZHwz/riIXgXkeUgauPn+aqWkKgA+oh+
 u1XNaOsjEmP6bLu5T5WIUKcj+fQdUpV6fMAFdnhlqgI/L/Y6SITIdfBGWba+OfnZtwGbI935rRn
 eOwdaYiVkG9u7clJW26hQ1MHj3J2jm3SGESIbcgkjRsQPcZPrlI9L3FjCIsBVuqd1Uyyb5HTd5y
 srN4dMR9JJdIR3qJcnUGqOWfssvqoMG5aWUKQ9BOGJr5pi8m+CBYzhWiBQAvlEGKI6xEV2od3GD
 bMNpXSZtCxMAViykjfJOAZ7Qfq7LwatYVJ83Xqb6roWKAz0gq3pFxl9nhKBzPm5kvzqaRQRUwVU
 fxG7waVSvyOUpHNtKzg==
X-Proofpoint-GUID: URLYLUv8gdrsiEPRf3CbshFl1NXom8kb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA3MSBTYWx0ZWRfX870dDJo22yek
 pxoCUHAJAKKqQgLLmFU+UIYz20ySDfPr9jP68tQcwSPRxc8dE8dQfDipJFjLkitY8BJ/pSBWulx
 v7aWvuC8Ui9gceMiAbJ6dObZClyndr4=
X-Proofpoint-ORIG-GUID: URLYLUv8gdrsiEPRf3CbshFl1NXom8kb
X-Authority-Analysis: v=2.4 cv=BrQIUoX5 c=1 sm=1 tr=0 ts=6ac3e8d6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HRj9tYUAe53e7GmFZk4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_05,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_111343_273557_B3576396 
X-CRM114-Status: GOOD (  11.69  )
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

On 6/11/2026 8:23 PM, Yingying Tang wrote:
> This reverts commit 809055628bce824b7fe18331abb65e44d02b0ecf.
> 
> Call trace:
> rcu_note_context_switch+0x4c4/0x508 (P)
> __schedule+0xbc/0x1204
> schedule+0x34/0x110
> schedule_timeout+0x84/0x11c
> __mhi_device_get_sync+0x164/0x228 [mhi]
> mhi_device_get_sync+0x1c/0x3c [mhi]
> ath12k_wifi7_pci_bus_wake_up+0x20/0x2c [ath12k_wifi7]
> ath12k_pci_read32+0x58/0x350 [ath12k]
> ath12k_pci_clear_dbg_registers+0x28/0xb8 [ath12k]
> ath12k_pci_panic_handler+0x20/0x44 [ath12k] ath12k_core_panic_handler+0x28/0x3c [ath12k]
> notifier_call_chain+0x78/0x1c0
> atomic_notifier_call_chain+0x3c/0x5c
> 
> ath12k_core_panic_handler() is invoked via atomic_notifier_call_chain(),
> which runs inside an RCU read-side critical section. The current code calls
> ath12k_pci_sw_reset() synchronously from this context, which eventually
> reaches mhi_device_get_sync() and schedule_timeout(), triggering a voluntary
> context switch within RCU.
> 
> Revert change "wifi: ath12k: add panic handler" to avoid this issue.
> 
> Tested-on: WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Signed-off-by: Yingying Tang <yingying.tang@oss.qualcomm.com>

I've posted a version to my pending branch that incorporates the tags, fixes
the Tested-on tag, and rearranges the commit text. I plan on promoting to
ath-current early Tuesday morning PDT followed immediately by a pull request
to wireless to hopefully get into v7.3-rc7.

I'll pick up any new tags, including Reviewed-by:, that I get between now and
then.

Please check:
https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=1606f6eeef30f540a6b6ba9ac47b86fa72198228


