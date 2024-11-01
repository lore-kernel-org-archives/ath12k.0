Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46FE2E6F06C
	for <ath12k@archiver.kernel.org>; Fri,  1 Nov 2024 16:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OECpEb3C40nifqFFTk3EVE+l+oT1aG0eXSibUIjmFCw=; b=KJtxVxttROACZc80lYiyx0Sp2K
	k+8130L+mHcHYLGmOSdBaeX/DtewgSCRvV8X9LcFxbjcSvOrySzsKYcn/tQSGNQOyReKqD9wYpmtP
	/yIt7ehFbgpRhhaSQEnIij9eqVF/ezbKdwUZ460KGXFd4lw5ZMNkm0xYFbGOlP09H0rPmArgc7NVg
	/W4tiXVEgvqch/FA9544Z/CFla+cA5KRAoeNDBRj/2Nt7pkSn/4IQgrmttBzS08svrM6KriaDR5dY
	AQ2jBTuw1nicefJpm3nC3oQNEInw1Emg5h5otp+JMhO1rSRrTNFDNhOF4Yh16N8jErNzRLqOr6s74
	FCSesSHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6uRv-00000007f5N-03Wv
	for ath12k@archiver.kernel.org;
	Fri, 01 Nov 2024 16:24:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6uPK-00000007eOI-0bcp
	for ath12k@lists.infradead.org;
	Fri, 01 Nov 2024 16:21:55 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A188NSK027265;
	Fri, 1 Nov 2024 16:21:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OECpEb3C40nifqFFTk3EVE+l+oT1aG0eXSibUIjmFCw=; b=d8X00vwpzW4KcEum
	imlesbZ2D6juxi6iIo4T4KkP7aeHWidsz1VjTYNx1K+oClFIh6ulhUFf6xIVdaLv
	QIL25bxyW59IKXt4f0dX+6MU/ZFcdzAsvV7nDUQNFAmmbvj+6uDtnzUxjps8CrkN
	5d5puFsmYhFbD7Tuh9MZ/+civr38XnAvcrDWsCvH5jXw48XJ9djVLIux4JOBDg3Q
	I0iICWtQInI2GKmW5jNKKPrc8EyM0fOQWrqhsRJQFB1rx65fJRROtgLm7vIYGW7a
	pFzkIEalat9u5ShwwmmhOmW2UYDh/L32Pl37euRCJr7ZdvE2WtgK6opFMHXrbmNC
	ZnR8ng==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42mu7c9hnw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Nov 2024 16:21:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A1GLnuT007623
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Nov 2024 16:21:49 GMT
Received: from [10.48.242.225] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 1 Nov 2024
 09:21:48 -0700
Message-ID: <0f1b2f1b-eabc-4e96-aa4a-1372db571588@quicinc.com>
Date: Fri, 1 Nov 2024 09:21:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] wifi: ath12k: ath12k_mac_vdev_create(): use goto
 for error handling
To: Kalle Valo <kvalo@kernel.org>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20241101151705.165987-1-kvalo@kernel.org>
 <20241101151705.165987-2-kvalo@kernel.org>
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20241101151705.165987-2-kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1JJIrQc8AkcVMA7ZdSVLLHXtDmbIw72G
X-Proofpoint-ORIG-GUID: 1JJIrQc8AkcVMA7ZdSVLLHXtDmbIw72G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 mlxlogscore=724 adultscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411010119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_092154_346324_FF63FDCF 
X-CRM114-Status: UNSURE (   8.06  )
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

On 11/1/2024 8:16 AM, Kalle Valo wrote:
> From: Kalle Valo <quic_kvalo@quicinc.com>
> 
> In commit 477cabfdb776 ("wifi: ath12k: modify link arvif creation and removal
> for MLO") I had accidentally left one personal TODO comment about using goto
> instead of ret. Switch to use goto to be consistent with the error handling in
> the function.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


