Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E601BC3DA49
	for <ath12k@archiver.kernel.org>; Tue, 16 Jul 2024 22:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FFsT2dcLrvoehxrf9nAtedp6V/lFWAB5CNhPv+iWuXE=; b=yoXbxKBj6QFlcbBl7BP0tc6tJN
	rmeoX8bNVU09rCf2fNE50sm6feaZJDeSB6YxTdvbQMei4pnlDUziATX1MCmUep2Chigz2RSVlK5MP
	waW/ji6unhZgnA8HMLIDtL7Q01J81CC5AUan7qhNtSvmDg08w86hlimG8v5pGBQ/08TkKls/IMWhh
	H4yeYc/GGKl++7oyKkqf86hGT216EnKd30Cj1lhXDXxijpBDuiyQCdIM73jyoFYs4i+lrR+59UOTB
	67LbQmvNMsCqPCnkBaq9xfGQrAZNL85qODNR9ojlkI1svJCDL0l6ug5ffzGGTns/m8+xU78db/vuh
	WwOv79Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTqp6-0000000Byzr-2c4Y
	for ath12k@archiver.kernel.org;
	Tue, 16 Jul 2024 22:39:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTqp4-0000000ByzV-1XWr
	for ath12k@lists.infradead.org;
	Tue, 16 Jul 2024 22:39:03 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46GHf3R3027005;
	Tue, 16 Jul 2024 22:39:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FFsT2dcLrvoehxrf9nAtedp6V/lFWAB5CNhPv+iWuXE=; b=AWpNZGxf41eFpuVl
	F3RRjglcGy/8VnyHT9qS4PC0dkoXM+VR6dzqhJu04eOUVCyIT3T0pT/kvgYbumMb
	dXdStndyEDSu+/7yg2G5mAtzCcM9nr3YwgchUC8ih+7yBf0ROnTgDfwsFAMhrXcN
	SW5VJirLDfWv5ITTSh6D1eT3GpRPq6FrCnxlUt+aktmwa2oqQYo2KUgFNwqPn2sN
	0wFgyYdI5/2y9R9/uka8EfjzJQS2RPrO6VvJ1J/HdPCfCuwV7dHAwrbQrnSny7Od
	zzI5NYbyLjCFt2tQ5TvWhTON0x2wHp5d0xT0fI+dC3w52wL9/UAjltlUgoQzjOd5
	BH4S4Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwfs0hdh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jul 2024 22:39:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46GMd0Hh010143
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jul 2024 22:39:00 GMT
Received: from [10.48.247.102] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 16 Jul
 2024 15:39:00 -0700
Message-ID: <05af9fe2-043f-40f9-b2a9-68b98ad82328@quicinc.com>
Date: Tue, 16 Jul 2024 15:38:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: restore ASPM for supported hardwares only
Content-Language: en-US
To: Aditya Kumar Singh <quic_adisi@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240709055817.3371406-1-quic_adisi@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240709055817.3371406-1-quic_adisi@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: xl-8f4Pd9T_0S56B6oD08lM2_uUVlvJl
X-Proofpoint-GUID: xl-8f4Pd9T_0S56B6oD08lM2_uUVlvJl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-16_02,2024-07-16_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=974
 impostorscore=0 mlxscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407160166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_153902_448153_A989B0C7 
X-CRM114-Status: UNSURE (   8.13  )
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

On 7/8/2024 10:58 PM, Aditya Kumar Singh wrote:
> During PCI based hardware device start up, ASPM is disabled for all. And
> once firmware is ready, it is restored back. However, not all hardwares
> (for example QCN9274) supports ASPM. Hence there is a need to conditionally
> restore ASPM back. Or else, for such hardwares, issue can be seen during
> sending and receiving packets.
> 
> Introduce a new hardware param supports_aspm which identifies whether a
> given hardware supports ASPM or not and then accordingly restore it.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


