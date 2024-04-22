Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A8B2C4345F
	for <ath12k@archiver.kernel.org>; Mon, 22 Apr 2024 14:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x/zEVgxPKSdqrMJCwVoTCE40GZRD5t3DQ7qTAS76jXc=; b=imOddz4dfwPMaNngocdxwUpQRn
	Y4Ujc2QdB33ZuXpqYQFQithKDJq4w8lkSv+bWCL/pZOj9cTkrcaqqBDamHrR4V+x4/ydMlEDt9C85
	rlC2t2q/bu2h2w+czBux4lKGd020LHfylbVj8kGLbERK9nb/DxtQ36aevRLoJcHgBpddiA9rgcxzg
	Shk/86Y9I5FLfNQshDDUXALUAFEblQ7WpEjnO3UdTOLubfLwbQl8YfrhM+WkYSUJK+a3bJECoCtPK
	l6e25mmgY4FbRp0oj/+JD2H9niRl0FGS3W+KujuoyV+lVlBT5Cl+d9DrMLB0FOxccX85yYGPw/hoU
	AOFDam7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryusY-0000000DyDt-0WLl
	for ath12k@archiver.kernel.org;
	Mon, 22 Apr 2024 14:42:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryusV-0000000DyBm-0nxK
	for ath12k@lists.infradead.org;
	Mon, 22 Apr 2024 14:42:44 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43M9ObG5025795;
	Mon, 22 Apr 2024 14:42:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=x/zEVgxPKSdqrMJCwVoTCE40GZRD5t3DQ7qTAS76jXc=; b=H5
	l1rqA5uyuggKdNvYKahje42WH1t7E2edjH3R66+1ugrZUhw1a/Qdm+8Hxd4lv9Ts
	FiVUZ7bboX8X5yI2vzoLlpCl3RSsLn4wi48WemB7qfgYIbbL/4LEj1lDl4ptgqqn
	87DcWrY7no1naO7gXxabMIxFFRW3gxJ1owmsAjmi3foeDQtVq2a+7jEh9IfLhn9H
	HuOqUuAHbImdACZDau9JNvUgFjfXhT93Rk2ax7qmDCuffZUWJnYwGv73cNZUGN28
	fZVX2AtqfTRFXNCgMs0a7089Grv44pjdrwbDjITjfTPNzk0SsVwBFa5dR3smcF2+
	K0qWTdVJXexzXaCfz7gw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xnn82gsu7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 14:42:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43MEge7u025723
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 14:42:40 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 22 Apr
 2024 07:42:39 -0700
Message-ID: <57a5d352-76fe-4aba-972e-e1e288d0a55a@quicinc.com>
Date: Mon, 22 Apr 2024 07:42:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath12k: read single_chip_mlo_support parameter
 from QMI PHY capability
Content-Language: en-US
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240418125609.3867730-1-quic_rajkbhag@quicinc.com>
 <20240418125609.3867730-2-quic_rajkbhag@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240418125609.3867730-2-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: popMfKOIbFKj85uim34XIy0RzsjVBSDE
X-Proofpoint-ORIG-GUID: popMfKOIbFKj85uim34XIy0RzsjVBSDE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-22_09,2024-04-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 suspectscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0 phishscore=0
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404220064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_074243_276661_CA92B418 
X-CRM114-Status: UNSURE (   9.77  )
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

On 4/18/2024 5:56 AM, Raj Kumar Bhagat wrote:
> New parameter 'single_chip_mlo_support' was added in QMI PHY
> capability response message. This is an optional parameter added
> in QCN9274 firmware. This parameter states if the firmware
> supports Single-Link Operation (SLO) and Multi-Link Operation (MLO)
> within the same device.
> 
> If single_chip_mlo_support = 1, then intra device SLO/MLO is supported
> in the firmware.
> If single_chip_mlo_support = 0, then intra device SLO/MLO is not
> supported in the firmware.
> 
> Hence, add support to read 'single_chip_mlo_support' parameter from
> the QMI PHY capability response message.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00209-QCAHKSWPL_SILICONZ-1

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

> 
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



