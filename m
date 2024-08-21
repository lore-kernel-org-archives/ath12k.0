Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C772CC52D7C
	for <ath12k@archiver.kernel.org>; Wed, 21 Aug 2024 16:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P96IDu99mJPZI9Kvf4dTHrJ7IuC5XQUSJPfedBEbBWo=; b=F0rDetcuiSaqKjZ0vU05r+rzO9
	gqGjh5ID1rBb4Hn3wbp8KimD02+FHg/xR5W+nCbGg8i+p1xh1Fv4vFVz3LpbEHiYVWwJTZi6oFiSB
	mOJGgeYHxiHTOFha9YFMqGNSVBewqhI0czICjX92wR6vGHhyY1pXogRicLbIbaShznWK6PBm43gyy
	Z7Rd57PVyEs80T9i6zweifFb3bhgUZ4AiNqdUxr096+jYOzcEQKGBE55emM7BhllQz3jl8/a14CJU
	YgBeqfBD6tphBPzb3OezocMiMhoVcGmdaE5QLWM0GyZ+A7HoeB+/XM4sFOME/MWsIPxRySeGyBFtn
	+VRHjicQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgoeV-00000009q2n-2Gy9
	for ath12k@archiver.kernel.org;
	Wed, 21 Aug 2024 16:57:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgocq-00000009pet-31be
	for ath12k@lists.infradead.org;
	Wed, 21 Aug 2024 16:56:01 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47LC4MBv004713;
	Wed, 21 Aug 2024 16:55:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P96IDu99mJPZI9Kvf4dTHrJ7IuC5XQUSJPfedBEbBWo=; b=mZMv/hQLVnA5oZYO
	P8zmUzPMORRwx7uNtXA54VthVw0UIpJ2G6OdVFYWMBJNHFCVdrwAOne8xblohLLv
	y5soorHKrJZ2Z2z9tmzNBBXV/4SWoBAG5iwdWPFDlWOydxO175H0U+7tVR+he1vD
	oPb4o+ZPx9BfYKJ8A7vpRkvOsYttPRvoqvWbviH3saReaFQeJskpQEkDwDeWlKrz
	dZMcVpM4+/clKfpw6uZwncjjxolxjv5rNjqeWE+6ortpFS3T1pZXiwO5TY5bHU9B
	3szHgqhGOMYy+l3REAVN4EetzbsqS0TGkao5IZIb+9h3PqsRetaUru8jjKCI26Y1
	wY0l3A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 414v5cc7w9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Aug 2024 16:55:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47LGtuNL013085
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Aug 2024 16:55:56 GMT
Received: from [10.111.179.139] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 21 Aug
 2024 09:55:55 -0700
Message-ID: <5ae832c0-8395-4d9b-a226-04255682c6d3@quicinc.com>
Date: Wed, 21 Aug 2024 09:55:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/4] wifi: ath12k: cleanup unneeded labels
To: Kalle Valo <kvalo@kernel.org>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240821153728.2121600-1-kvalo@kernel.org>
 <20240821153728.2121600-3-kvalo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20240821153728.2121600-3-kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HVL60o7_TLSvGn6_Lvhl0hCcravD3S6X
X-Proofpoint-ORIG-GUID: HVL60o7_TLSvGn6_Lvhl0hCcravD3S6X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-21_11,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 mlxlogscore=780 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408210123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_095600_807374_B59CFCA6 
X-CRM114-Status: UNSURE (   7.10  )
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

On 8/21/2024 8:37 AM, Kalle Valo wrote:
> From: Kalle Valo <quic_kvalo@quicinc.com>
> 
> After removing the conf_mutex in the previous patch there are no unnecessary

nit: s/ no / now /

> labels in mac.c. Sparse also warns one instance of it:
> 
> drivers/net/wireless/ath/ath12k/mac.c:6635:1: warning: statement expected after label
> 
> Remove the labels and instead use directly return.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>


