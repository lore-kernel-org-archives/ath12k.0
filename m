Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA63C46CD2
	for <ath12k@archiver.kernel.org>; Tue, 30 Jan 2024 16:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cr0YdQpnMyYKZ+s9d3f/zqHJHM8BdGvg69UMWQgzggs=; b=2xtrFN3GeIpWFP2YdJZCNVd/RL
	1yjIK1NXVm9mcQFFx3zwrM2Fae84MkewvG+C2XNxOljKUhJPPAtCEwdRn/cpA2/RSXMZ/XJQu+Qeq
	lmalsIPdj/+uFvLYuemdZSIvsgW3untfF6xy47HEu5a1onwnSUHnH+3eV4iXd851ojolvLAIqnzjY
	Rm23nRyRBmMBkrn9voZy2Zi7FFF7qpFhfKyOptoFfjhg3cOULFI6Hj4Tov37R3VwgWZReqtseiIbN
	OyLKbDuNDGvfoRfYhO67Ei1DuG1O2i9uf93MQaBXfPVzdckxAfaELI2w5tBVWLeJB4br3wCvhGXH2
	xgJyTA3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUrKM-0000000HS01-25AW
	for ath12k@archiver.kernel.org;
	Tue, 30 Jan 2024 16:51:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUrKH-0000000HRxp-3gHe
	for ath12k@lists.infradead.org;
	Tue, 30 Jan 2024 16:51:12 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40U9SD9e013333;
	Tue, 30 Jan 2024 16:51:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=cr0YdQpnMyYKZ+s9d3f/zqHJHM8BdGvg69UMWQgzggs=; b=gm
	ChN6F/jqIcBH1lm0up8Nrt4cla3mUvnlAlQ0o8v9h4pwoRzvsRgYqW5uSTbe+VxN
	+j8u3Zzti1hF1KYPrRDzMb5KnfzvKBRto44bIQ3WiQy02TfbSQOixD+CuP3JejvQ
	Q7S9ZSuFty3gEbQ+Y2ohIlfWpN2YW++EWCFUL8woKz0Q4utToqt580JugUBYPg85
	9yyLD7Kp0K0zPP23EPyKnikwPG59H+CpAg+EEZAJMUPbv9gINWtT9LDXqNi+YJTT
	0d7Y/czWMnfMdaRhyJvWeTWrDzm0X/p10yTeaWQR56ErEF+fotnFMXAn5JsXHu7u
	xvg8xyY7t1SjoEt68+7Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vxvve18ae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jan 2024 16:51:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40UGp7BE025862
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jan 2024 16:51:07 GMT
Received: from [10.110.47.232] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 30 Jan
 2024 08:51:07 -0800
Message-ID: <ebd1b476-7de7-4cd2-96b0-ae4965348ccb@quicinc.com>
Date: Tue, 30 Jan 2024 08:51:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/11] wifi: ath12k: fix incorrect logic of calculating
 vdev_stats_id
Content-Language: en-US
To: Kang Yang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240130040303.370590-1-quic_kangyang@quicinc.com>
 <20240130040303.370590-3-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240130040303.370590-3-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JNw3yVpLUpfkLN5lKFbKtBlFYJNfimXr
X-Proofpoint-ORIG-GUID: JNw3yVpLUpfkLN5lKFbKtBlFYJNfimXr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-30_07,2024-01-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0
 mlxlogscore=915 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401300124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_085110_155851_90FB23ED 
X-CRM114-Status: GOOD (  10.06  )
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

On 1/29/2024 8:02 PM, Kang Yang wrote:
> During calculate vdev_stats_id, will compare vdev_stats_id with
> ATH12K_INVAL_VDEV_STATS_ID by '<='. If vdev_stats_id is relatively
> small, then assign ATH12K_INVAL_VDEV_STATS_ID to vdev_stats_id.
> 
> This logic is incorrect. Firstly, should use '>=' instead of '<=' to
> check if this u8 variable exceeds the max valid range.
> 
> Secondly, should use the maximum value as comparison value.
> 
> Correct comparison symbols and use the maximum value
> ATH12K_MAX_VDEV_STATS_ID for comparison.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

should be blank line between unofficial Tested-on tag and official Fixes tag

> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> 
And no blank line here since all the official tags should be together

> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>

Kalle can fix the above when he moves into the pending branch

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


