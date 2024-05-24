Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6575BC25B74
	for <ath12k@archiver.kernel.org>; Fri, 24 May 2024 08:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RgYf5MB7r/0mk8aB3LLbW/fm/qJZ0PkJuMoA5teU8cM=; b=49lv3ixbt6fehzc88oaHXG95+N
	S7FJQDaiq6+Iysp9SUcHSzDAVu7eTGfXFm/BJgY4W12jPJ4lKq7fNPjTvyr8qGzOPYjfw9MINDpZs
	8PKVZu3Gb8FNp0+Z1K3WyFNsCvUTr1PfvOuUP6pkR9014yAj7hjAEk6nFqDHxARDmg+OUoveaqNHm
	hXnDfhdHs0ev8NEvsXQtg/qKrfUETWSPn9aXP3iXrLch8lSECUUdHnL00FD6p01HkezuJuiwkXSuB
	5AfT5Xhd8OuecvOiVmYayMvE3p5wcwyBr/5zc2TL7enrRPRpQiJeosro3dtp/GTsEC21QdsTtErRt
	3tI+0ZVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAQ4N-00000008M64-0XLU
	for ath12k@archiver.kernel.org;
	Fri, 24 May 2024 08:14:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAQ4K-00000008M5d-1tpx
	for ath12k@lists.infradead.org;
	Fri, 24 May 2024 08:14:30 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44NNOsRf012346;
	Fri, 24 May 2024 08:14:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RgYf5MB7r/0mk8aB3LLbW/fm/qJZ0PkJuMoA5teU8cM=; b=CQ0Cp/z/zl0XQfKF
	Z2jac5LduY6iit3loTo4iZN+90FKK9QDj5C+IwYUEPbv9T1zTVyvlOxJKoC8sDq3
	fjXmu1Cw3glHpnMNMB1qlsbni/gp7lCBJplIJBFUSqvI4VJSk5iTVXag7ysP3ocz
	yo8dCd2COyjRqRj7Dyf9tBDYxqr55JrU968K3Okw+jxm4/fRlk1Reb1qKcvxCVrk
	q5N5z/p9GSb2luZyTb0VbGbXGzw+l620b3qwaXagavMGVbDBZRzQ4ZzLRyOTuSeY
	VcR+97jKSm7WoEPWb4Fu7uih14H+eRiRTXASEWPWTa5uRWiI7ajys+I9odq+GwPm
	5SFAnA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yaa8hskv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 08:14:17 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44O8EG4Y021498
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 08:14:16 GMT
Received: from [10.253.73.87] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 24 May
 2024 01:14:15 -0700
Message-ID: <279f4d5e-692d-430b-b0ab-312e1ee3c8d2@quicinc.com>
Date: Fri, 24 May 2024 16:13:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] wifi: ath12k: add 11d scan offload support and
 handle country code for WCN7850
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <quic_jjohnson@quicinc.com>
References: <20230914090746.23560-1-quic_wgong@quicinc.com>
 <87ttrd6s4j.fsf@kernel.org>
Content-Language: en-US
From: Kang Yang <quic_kangyang@quicinc.com>
In-Reply-To: <87ttrd6s4j.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: HuRvH5YUC8FBifv9ePF9r6oGrpMgkLUL
X-Proofpoint-GUID: HuRvH5YUC8FBifv9ePF9r6oGrpMgkLUL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-24_02,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 clxscore=1011
 impostorscore=0 suspectscore=0 mlxlogscore=768 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405240055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_011428_596544_A27AE66E 
X-CRM114-Status: UNSURE (   9.34  )
X-CRM114-Notice: Please train this message.
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



On 9/29/2023 9:11 PM, Kalle Valo wrote:
> Wen Gong <quic_wgong@quicinc.com> writes:
> 
>> v2: change per Jeff.
>>      1. change alpha2 length from 3 to 2.
>>      2. change wmi_11d_new_cc_ev to wmi_11d_new_cc_event.
>>
>> Add handler to send WMI_SET_CURRENT_COUNTRY_CMDID which is needed for
>> 11d scan offload to firmware. And add support for 11d scan offload for
>> WCN7850.
>>
>> Also fix firmware crash for country code set for WCN7850 and store country
>> code for device recovery for WCN7850.
>>
>> Wen Gong (4):
>>    wifi: ath12k: add configure country code for WCN7850
>>    wifi: ath12k: add 11d scan offload support
>>    wifi: ath12k: avoid firmware crash when reg set for WCN7850
>>    wifi: ath12k: store and send country code to firmware after recovery
> 
> Patches 2 & 3 had trivial conflicts with rfkill patches, fixed in the
> pending branch:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=3261a8fe9de8fd5a94215eaf0c8738c3f0051105
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=0f82a7f8a8d1944faea458f992d492daa74a968e
> 
> No need to resend because of this.

Hi, kalle

	This patch-set is important to WCN7850.
	Without it, WCN7850 cannot even set country code with board-2.bin now.

	iw reg set US/CN..:

[ 4623.473098] ath12k_pci 0000:03:00.0: Regulatory Notification received 
for phy2
[ 4623.475719] ath12k_pci 0000:03:00.0: No reg rules available
[ 4623.475775] ath12k_pci 0000:03:00.0: failed to extract regulatory 
info from received event
[ 4623.475825] WARNING: CPU: 5 PID: 0 at 
drivers/net/wireless/ath/ath12k/wmi.c:5789 
ath12k_reg_chan_list_event.isra.0+0x5d4/0xb30 [ath12k]
[ 4623.476823] CPU: 5 PID: 0 Comm: swapper/5 Tainted: G        W  O 
  6.9.0-wt-ath+ #17
[ 4623.476836] Hardware name: AMD Mayan-PHX/Mayan-PHX, BIOS RMH1001gC 
05/08/2023
[ 4623.476848] RIP: 0010:ath12k_reg_chan_list_event.isra.0+0x5d4/0xb30 
[ath12k]
[ 4623.477032] Call Trace:
[ 4623.477059]  ? show_regs+0x63/0x70
[ 4623.477080]  ? __warn+0xcb/0x300
[ 4623.477096]  ? srso_alias_return_thunk+0x5/0xfbef5
[ 4623.477118]  ? ath12k_reg_chan_list_event.isra.0+0x5d4/0xb30 [ath12k]
[ 4623.477155]  ? report_bug+0x318/0x400
[ 4623.477186]  ? handle_bug+0x85/0xb0
[ 4623.477205]  ? exc_invalid_op+0x1c/0x50
[ 4623.477225]  ? asm_exc_invalid_op+0x1f/0x30
[ 4623.477263]  ? ath12k_reg_chan_list_event.isra.0+0x5d4/0xb30 [ath12k]
[ 4623.477305]  ath12k_wmi_op_rx+0x6a1/0x1900 [ath12k]
……

	Also, 11d scan need this patch-set too.

	So, what's your plan on this patch-set🙂?
> 

