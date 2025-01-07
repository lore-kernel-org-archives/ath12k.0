Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4B2E77188
	for <ath12k@archiver.kernel.org>; Tue,  7 Jan 2025 01:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FzFz3ZS2SpifsNknJ1s18qEX0TT65AVdtP+7DJjCLMg=; b=j9v2CTyFq73zW2cvAzYy7xrFB7
	Orx1sg3k9czHuOEqdxEHAEdYP2ZLD9FPyG9KsXZfjllu2/E/OBCPzxKmzVN2eWY1PWVTrzL0ssjKb
	DQmruCTOA7RzVkSZ2PPcw8lKWmGQQuy+adbcQBGy6PhKSpCp1lgoOwr6yWfwoZehCErMMqRpA0L99
	i/IkonhjAZ6uLiYzVaaDXeAn2Z/EoEg+m2JRH6Mne858ECwr3BpJyeDxsZl3i3ppfGeXfsStiLE4I
	baaYx/uKD4WjJsjonZvcf/Cm8eca4vnOeta0BwzfMIGaanhrJQSxnSXmh2dOj5q5EQ7AEX/9lWzsM
	GAzdESWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUyNt-000000037YA-2Geu
	for ath12k@archiver.kernel.org;
	Tue, 07 Jan 2025 01:27:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUyNo-000000037Xm-45nj
	for ath12k@lists.infradead.org;
	Tue, 07 Jan 2025 01:27:52 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5070MYDq006449;
	Tue, 7 Jan 2025 01:27:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FzFz3ZS2SpifsNknJ1s18qEX0TT65AVdtP+7DJjCLMg=; b=p7cw8yiZU0uUkF/c
	g/BAKOr8mZOkMvJsk0fWAdNdQ0kr3tNEE/G0uH0TYAbv6AcsJIQmNxObyhYNgA2H
	EFQxJrvRXRf6y9CbRGXe8/gwYybtWz6uy3qU3kmLnxYeWl+AH3m0uDQqoJnqkROX
	F+AHF8OyZZgUIy/fGpPQuQgp/MHFFrVky4PYi85wnL6pGlw1JfPLBq8vD4wMgLMP
	QPhwSPYU2K9Q2oA2RmooipYd9gh3dyGHhjZmg1xCmU7mTo+IyhGCSTIJqTPQk0Az
	NMa6fycUMI5yaRV4biyzxMHQGgWghbjxMhUR9b4fpPtRQJB2k+P5jhJUJAVHx8Pr
	+Yh3Pw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 440m4a0syk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 01:27:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5071RkPD017097
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Jan 2025 01:27:46 GMT
Received: from [10.216.19.19] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 6 Jan 2025
 17:27:44 -0800
Message-ID: <33ce0af0-a2d4-415b-9b64-87e42192f933@quicinc.com>
Date: Tue, 7 Jan 2025 06:57:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix tx power, max reg power update to
 firmware
To: Santhosh Ramesh <quic_santrame@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Sathishkumar Muruganandam
	<quic_murugana@quicinc.com>
References: <20240909073049.3423035-1-quic_santrame@quicinc.com>
Content-Language: en-US
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
In-Reply-To: <20240909073049.3423035-1-quic_santrame@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bvJkWwtbXjmZrx306RMBj2uP4W0lmEJF
X-Proofpoint-ORIG-GUID: bvJkWwtbXjmZrx306RMBj2uP4W0lmEJF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 suspectscore=0 spamscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501070009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_172749_021275_9F004A43 
X-CRM114-Status: GOOD (  12.79  )
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

On 9/9/24 13:00, Santhosh Ramesh wrote:
> From: Sathishkumar Muruganandam <quic_murugana@quicinc.com>
> 
> Currently, when the vdev start WMI cmd is sent from host, vdev related
> parameters such as max_reg_power, max_power, and max_antenna_gain are
> multiplied by 2 before being sent to the firmware. This is incorrect
> because the firmware uses 1 dBm steps for power calculations.
> 
> This leads to incorrect power values being used in the firmware and
> radio, potentially causing incorrect behavior.
> 
> Fix the update of max_reg_power, max_power, and max_antenna_gain values
> in the ath12k_mac_vdev_start_restart function, ensuring accurate
> power settings in the firmware by sending these values as-is,
> without multiplication.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00214-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")

> Signed-off-by: Sathishkumar Muruganandam <quic_murugana@quicinc.com>
> Signed-off-by: Santhosh Ramesh <quic_santrame@quicinc.com>
> ---

Hi Jeff/Kalle,

It would be good, if Fixes tag can be added while applying this patch.


-- 
Aditya

