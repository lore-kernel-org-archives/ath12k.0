Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFEEFC02181
	for <ath12k@archiver.kernel.org>; Fri, 24 Jan 2025 15:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i4vYsRoGAV2U2Z+oNkxtW1YjRtSaGuoboQehCkxJ71g=; b=sgCfgZsjbt5E7E01Gj1RGXKXgk
	qNnTIznsmPMknaKUQmtkGf6RQc4CgFyLZw4NI8tFTrbvdxy+ucKN8LFRQ6TXMvR2cBmWBil4GJmDl
	rL1KogVkM2Xnv76/wswxg0Twp/y2wx6ObpNrHGXno9RDbbItH3Lt+A99xDmdrA+YiYR7UkASnGzXs
	TPF+jH0B7ldt2/LLcxyPeCEdiRDpLmlS5KjK3UVE7jzQHgl44xCurk5mG1T73vOD01Imw4nVsHS15
	KE7Ur1l2t8AxoydmHUXHgeW8BcvfXi30Lei1Gp8ExIFn1/H+/HByxKzFY9kODgWVA7QDsigAb2XO6
	R/Pxzg4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbLed-0000000Ezy6-1vwd
	for ath12k@archiver.kernel.org;
	Fri, 24 Jan 2025 15:31:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbLea-0000000Ezwm-2s0R
	for ath12k@lists.infradead.org;
	Fri, 24 Jan 2025 15:31:29 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50OBkpuO003133;
	Fri, 24 Jan 2025 15:31:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i4vYsRoGAV2U2Z+oNkxtW1YjRtSaGuoboQehCkxJ71g=; b=ZPQNB/5wtQvNEaj7
	LwFTm2CCUJezA8p6PNmaoH5rPKmIfAlEYVL1/aVRwXcRMdHGLuj/egQFAPvkUbII
	WQI43aLPSXomfiPdp1znf43deKq3ivlzChUAIhIEeOHxNgwgvQvh4BU3T4dKTs1f
	ytp+SEdDjchVdWJHDqJhWj7SMW+a9lSQlvP3hNSOteMdDanJG42faPK6PA1x8YwP
	8m5eYmpwwJS9MLViVPethHO4AZXeHUL11TnDflo2BzNsycP1ORrivRWx+foidgky
	TyfSI8rjskSgJ5wo5EmplIgmJTUFF062QhsTxKNR74p7zfneuc2DA7CkuOGGLHjv
	eTa1lg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ca9prgq4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 15:31:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50OFVONW024494
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 15:31:24 GMT
Received: from [10.216.30.251] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 24 Jan
 2025 07:31:23 -0800
Message-ID: <a979cbc5-5cfe-160d-d5b9-9e5ed7513ed1@quicinc.com>
Date: Fri, 24 Jan 2025 21:01:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] wifi: ath12k: fbx: fix ath12k_hal_tx_cmd_ext_desc_setup()
 info1 override
To: Nicolas Escande <nico.escande@gmail.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250124113352.93638-1-nico.escande@gmail.com>
Content-Language: en-US
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <20250124113352.93638-1-nico.escande@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: j1EEd4gXQjKRCVzGsakdpHTZ6LvtoxEO
X-Proofpoint-ORIG-GUID: j1EEd4gXQjKRCVzGsakdpHTZ6LvtoxEO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_06,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 mlxlogscore=882 adultscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501240109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_073128_723929_ED08A641 
X-CRM114-Status: UNSURE (   5.93  )
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



On 1/24/2025 5:03 PM, Nicolas Escande wrote:
> Since inception there is an obvious typo laying around in
> ath12k_hal_tx_cmd_ext_desc_setup(). Instead of intitializing + adding
> flags to tcl_ext_cmd->info1, we initialize + override. This is needed to
> make broadcast frames work with ethernet encapsulation.
> 

SUPPORTS_TX_ENCAP_OFFLOAD not yet advertised by ath12k. How it work with 
ethernet encapsulation ?


-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

