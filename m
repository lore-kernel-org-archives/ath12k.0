Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE11C4345F
	for <ath12k@archiver.kernel.org>; Tue, 30 Apr 2024 18:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TYbhv4+itN+J+L2rEkVGp8EGBVowo6xyD1fsVvmZsjw=; b=NegpyqkYRapCp9w+4dE6REQsQD
	U/ub6sgnbopCbMPbQdJc1wiyJcKjHcK3XAA9PXbgEkYKjpfHrLQ8rBTDCa2hV8OJq8P68hBeXaUeX
	LSr39MCTWFe/f2yOZFVeCSH+F0kcBvS8RIVIkVv+6X0RqaGGhVVxyJ5HM+vvFGGdXEn3pxOAZZKcw
	vC8GMagMn/9sFuyybzh52SfSfk1nKKMM1gv34AvTL95ss94QxuNaR25s7yK5esQs733i7n0PZrCDY
	5RLBD1cauOODuuqCv/On/4gztbTNVQRjM4toi07GGihE1x2MuyDn3X2aQKOUk4E4k78tsbhGdOd4Q
	2JKV+yrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1sRn-00000007cwV-02vw
	for ath12k@archiver.kernel.org;
	Tue, 30 Apr 2024 18:43:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1sRj-00000007cvn-41mk
	for ath12k@lists.infradead.org;
	Tue, 30 Apr 2024 18:43:21 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43UELvQA012575;
	Tue, 30 Apr 2024 18:43:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=TYbhv4+itN+J+L2rEkVGp8EGBVowo6xyD1fsVvmZsjw=; b=pr
	CAWFPfvXbbvPH91xshTGOR7THiak8uKijyFKU7cubYxO/juUN1OYq8aOfhUnjh2l
	XqFpUy+UZPcD+uHtvQlEMEHGo7QYMyLIIvN/i6pty3eDLEcXAlSwMb1CqaiEev+5
	cqyo25CJLhl5GmXi0jMbKMuYjAcFsIKuSTBOuEqu0EWsEk/4ivuGfXjTbmUZSedG
	QETrVdyDqmwBDpFmEDs8AgSRcrwHbqeS/rOiw6JuWwaZHirnfygVOFPrOrdMr+bT
	PHlITLiGJE9XmIq9AABOu+a8Nv7p7dRZtQX2hOtr9//wDqqedtRfTj6oUijJSrMT
	QYNGEkTNcZzq7cbIQXAA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xtsnma85h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 18:43:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43UIhI5D028966
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 18:43:18 GMT
Received: from [10.110.13.147] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 30 Apr
 2024 11:43:17 -0700
Message-ID: <047ecf09-fe6a-451d-b94f-7a3e89d74fe3@quicinc.com>
Date: Tue, 30 Apr 2024 11:43:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] wifi: ath12k: Refactor idle ring descriptor setup
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240430165811.1377182-1-quic_periyasa@quicinc.com>
 <20240430165811.1377182-3-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240430165811.1377182-3-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -R8stK28NTF-s4sg1DtMU-5ZCEKe3gzQ
X-Proofpoint-ORIG-GUID: -R8stK28NTF-s4sg1DtMU-5ZCEKe3gzQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-30_12,2024-04-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 mlxlogscore=528 phishscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404300135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_114320_042809_26BDECFF 
X-CRM114-Status: UNSURE (   8.60  )
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

On 4/30/2024 9:58 AM, Karthikeyan Periyasamy wrote:
> Currently, the WBM idle ring descriptor setup uses implicit value
> HAL_RX_BUF_RBM_WBM_DEV0_IDLE_DESC_LIST for the return buffer manager
> parameter. To support inter-device MLO (Multi-link operation), this
> parameter needs to be configure dynamically based on the device identifier
> within the MLO group. Therefore, introduce a new argument to the helper
> function ath12k_hal_set_link_desc_addr().
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


