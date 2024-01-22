Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4584EC47DD9
	for <ath12k@archiver.kernel.org>; Mon, 22 Jan 2024 17:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=skADsusE5cYMrUI6vixhB2mBE0F8QCvNnRSX6mz4n2I=; b=d5XfU879oYEQ6eww3qOhta/D+o
	yg8oernCRUgvuvxi2Wv3HwqJUiX/7QJK7I0kHDImUaU3u97aWx7lIUWDJCB59Uu+S/GES+hNg0UeQ
	RBbED+Aevq+3ZwmIT7nwd1oCVFV8cn4c0T4k8omsCCQRdame0LqDHP2nOztG7mjmD4eJTi0/9qYtM
	fzod3vx2SXS4vsuJG65gvyJRE+jpktBaaMSHNwJQyrgdpWhzpyqzMhsQ6g8Hby4AF1VIOjNEbFAbG
	vEXdIhA/uDmOX+NxaTLGnNHzDYCXu/GWqCjj8sdsc08y3E58tkG/k2tz5juTNHJOlfZLjn6tBc2Oc
	jkuEe+4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRyPJ-00DLVN-2j
	for ath12k@archiver.kernel.org;
	Mon, 22 Jan 2024 17:48:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRyPH-00DLUg-0B
	for ath12k@lists.infradead.org;
	Mon, 22 Jan 2024 17:48:24 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40MEvNTh014268;
	Mon, 22 Jan 2024 17:48:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=skADsusE5cYMrUI6vixhB2mBE0F8QCvNnRSX6mz4n2I=; b=BW
	lPRqfMxVKzllUJ16yxV7s9piBJaYC0OUPG3W+b0ZpmabMtHaMD3qYBrch1yL12LP
	9MRm3Mb9HW1DRYyov8+Ly9aHA0NW0HMazbaE4zLZe5SIQOu0Gs2nF1FGOQ0wQiLk
	524lJX8wf5mwTGP8FHUKhelNIk7H+wWcm8L5yhA1Hg30LlEAYA1IgMb299RYAplN
	SagyPTQXcnQQR4MkA14otzSJxobjAaEabK+qgAtopErY9mrv63cXhkTicURY6fvC
	VdRWr3o6EgSNmiDABSwhd06EZDbmyASeUdALSFwC3xX0hUynAVeDuuOCe8U2cHgj
	HoIb5CfOl+RDLVc1JoWQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vssw9gg8w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jan 2024 17:48:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40MHmKSV022172
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jan 2024 17:48:20 GMT
Received: from [10.110.26.199] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 22 Jan
 2024 09:48:19 -0800
Message-ID: <f410e661-e46c-4ec3-8775-fe80f26418fc@quicinc.com>
Date: Mon, 22 Jan 2024 09:48:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] wifi: ath12k: add processing for TWT disable event
Content-Language: en-US
To: Lingbo Kong <quic_lingbok@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240122085336.3985-1-quic_lingbok@quicinc.com>
 <20240122085336.3985-3-quic_lingbok@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240122085336.3985-3-quic_lingbok@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7yOyQSXJQ4Qso2Fa-BAvnHlhiQ2cCzvL
X-Proofpoint-ORIG-GUID: 7yOyQSXJQ4Qso2Fa-BAvnHlhiQ2cCzvL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-22_07,2024-01-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 suspectscore=0
 mlxlogscore=646 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401220124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_094823_102980_CE9D39B6 
X-CRM114-Status: UNSURE (   9.13  )
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

On 1/22/2024 12:53 AM, Lingbo Kong wrote:
> When ath12k send TWT disable command to firmware, firmware will return a
> TWT disable event to ath12k. Through the analysis of TWT disable event
> status, we can easily obtain the status of TWT disable command. It can be
> more convenient to debug TWT.
> 
> This patch works with WCN7850 and QCN9274.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


