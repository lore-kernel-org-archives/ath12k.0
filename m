Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E928EC369A5
	for <ath12k@archiver.kernel.org>; Tue,  8 Apr 2025 10:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FkFu9vc+L7I2a1oMcaw2n/CWQ0g4s85E9Ltlmjt2qws=; b=4SMEF26RbXRABcZgdUkSCsK1Cj
	jWnCJt4jDLnElZZsW+Ptx0w0HtxryoSEXE9nd8oC07gZ/SoZoWexicqch62IkVosy6mEGm7qcZIKr
	5iSGO8PMddAUJWZ5W45CFnPKlOt3NKbHKUUbI+oH+yjwV6G2vuq7iygztquPuzrcbXNXPaYH0BZhs
	HJ/GDWi2nkmBli9qoxgPaTMnbd0dSYa1CctXvOgeNBbqoC5soDovv/Ld6aFqDnE+wWblCLAc5VAty
	e/vdUtCyhVyigaRzlOyVwUAAeg5pttiKkWNjSjKE5ba3ab4Li5LXRLCislwX1iSEaYxqUcaqDm13r
	mb2ybFLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u266S-00000003df4-2Eat
	for ath12k@archiver.kernel.org;
	Tue, 08 Apr 2025 10:22:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25dh-00000003WNO-3F15
	for ath12k@lists.infradead.org;
	Tue, 08 Apr 2025 09:53:07 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382GMJU032597;
	Tue, 8 Apr 2025 09:53:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FkFu9vc+L7I2a1oMcaw2n/CWQ0g4s85E9Ltlmjt2qws=; b=k7um2XIbLWyadJ4h
	8jqi7bkkFf3I5lSoDqpa0+DYk8nN5bVZ29/Nk7mb511f9bJn59teZDKc6EyF2UWU
	oBeJs+vey1u5Wnx9Z6YxixTWjKUKH9U2rj+8SP5h+hfE3xS3QrQx6jNkfb5uRzlG
	UUCdWRjwsR69txvYCVe6No4zCq66489YTRyqnCGRB8dnvcDq2gl/dFEhBYPlwdMX
	wlSqmK/enayjSpRAqf5iD8UGfa+HmOAr2jb3QX+ZnuP7UP//OwHowbVHyPNimio8
	eDqkCNElvtaVBj5uRKkdUuoErMq+D4UX3Qg4cl9lqY7P8R6lKB5XhuFrP6Qj74SE
	/WBCUQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfkf7fc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 09:53:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5389r1Sp010055
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Apr 2025 09:53:01 GMT
Received: from [10.216.15.222] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 8 Apr 2025
 02:52:57 -0700
Message-ID: <1e31fe1c-333b-b841-5419-1c8be9a762dc@quicinc.com>
Date: Tue, 8 Apr 2025 15:22:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next v4 4/9] wifi: ath12k: fix ATH12K_FLAG_REGISTERED
 flag handling
Content-Language: en-US
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Johannes Berg
	<johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        "Karthikeyan
 Periyasamy" <quic_periyasa@quicinc.com>,
        Kalle Valo <kvalo@kernel.org>, Harshitha Prem <quic_hprem@quicinc.com>
CC: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20250408-fix_reboot_issues_with_hw_grouping-v4-0-95e7bf048595@oss.qualcomm.com>
 <20250408-fix_reboot_issues_with_hw_grouping-v4-4-95e7bf048595@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
In-Reply-To: <20250408-fix_reboot_issues_with_hw_grouping-v4-4-95e7bf048595@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: A1q2bfSNl2ypl_X_camrE5lL9qDPjINd
X-Proofpoint-ORIG-GUID: A1q2bfSNl2ypl_X_camrE5lL9qDPjINd
X-Authority-Analysis: v=2.4 cv=b7Oy4sGx c=1 sm=1 tr=0 ts=67f4f1fe cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=ruYZI2x8ojLE5oLC07EA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_03,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxlogscore=805 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_025305_951571_8EFC729D 
X-CRM114-Status: UNSURE (   7.91  )
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



On 4/8/2025 11:36 AM, Aditya Kumar Singh wrote:
> Commit a5686ae820fa ("wifi: ath12k: move ATH12K_FLAG_REGISTERED handling to
> ath12k_mac_register()") relocated the setting of the ATH12K_FLAG_REGISTERED
> flag to the ath12k_mac_register() function. However, this function only
> accesses the first device (ab) via ag->ab[0], resulting in the flag being
> set only for the first device in the group. Similarly,
> ath12k_mac_unregister() only unsets the flag for the first device. The flag
> should actually be set for all devices in the group to avoid issues during
> recovery.
> 
> Hence, move setting and clearing of this flag in the function
> ath12k_core_hw_group_start() and ath12k_core_hw_group_stop() respectively.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Fixes: a5686ae820fa ("wifi: ath12k: move ATH12K_FLAG_REGISTERED handling to ath12k_mac_register()")
> Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

