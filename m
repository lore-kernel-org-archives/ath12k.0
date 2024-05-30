Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77591C25B74
	for <ath12k@archiver.kernel.org>; Thu, 30 May 2024 17:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b4PntusyRgZjr5WLFu1PEzVzFqheiERopRQLznTyWYY=; b=TeAJpEBq8pKz3SFXvOmV4H33gS
	7A5lWYFuS815BsulHxicxQ6fedSKq7S8k07Y+2Ifg5o3VHNVN5JnXFKgzTzmhzsItIpNk0MaSEeQ/
	av4UAPh6N801REsrx1pOjWY7Wg4VRHC7uoZSzqSkyHMr/t7h+WH+fjbI+/UMJSQd0CJUl3d7/P4iX
	fJJp/DSvcUyNpKZ/PhieYBY2Jcn74xVgL/obGf2Ff16J1qhdVi2tgZtxZpFjpl5hiPIt5sKvFghra
	L3TkcciBPMqXk/b7Kgpiiaab09CCSN1TE7D7lhBRDhWw1rKwyFjUKRxjT0j/WgNg/viEBF0A4muS3
	Ly10LaGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCk0A-0000000839l-0Sig
	for ath12k@archiver.kernel.org;
	Thu, 30 May 2024 17:55:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCk07-0000000839K-0Byy
	for ath12k@lists.infradead.org;
	Thu, 30 May 2024 17:55:44 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44UERiOQ015783;
	Thu, 30 May 2024 17:55:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b4PntusyRgZjr5WLFu1PEzVzFqheiERopRQLznTyWYY=; b=Db5xdLsJixrQhgNO
	9DJ0Joo0ZhcxL/TbsPFyt4iEO0HH3bBrNvLJIwZBJsyk/S+f//qqMnn9IQnoCTIP
	X6iaqslgPULuhA1JFHJQx7L7RMS+Or1VzANGim1wHFRfTjM0JWb0oIM8SZpyTgl3
	aVxZnmla1KRDcGrwhJGEDYRYd/KJj9jW+kJ0S5M9FN6yOGsmt7xl2Nnt9zW/Fydl
	NgWPaY/VGcBZQFnOm9g26pS6Sb0OJO8TRbMKShlG7k28UuvLxqlsyJxsIvIkyd+w
	rfVSv6MKzPP+rWTq8/jo+4YmINF23iE90DslAump9FsxGMFC1DBibPeW4wVy9fA8
	aneMJA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ydyws4ej7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 May 2024 17:55:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44UHteSP019203
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 May 2024 17:55:40 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 30 May
 2024 10:55:39 -0700
Message-ID: <b3ff72fc-c4bd-4cb5-a6d6-ad6772657d6a@quicinc.com>
Date: Thu, 30 May 2024 10:55:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] wifi: ath12k: add ATH12K_DBG_WOW log level
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240530072714.25671-1-quic_bqiang@quicinc.com>
 <20240530072714.25671-2-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240530072714.25671-2-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: lZvV4HbVNn8hY1doq0hUALP59I_42VMi
X-Proofpoint-GUID: lZvV4HbVNn8hY1doq0hUALP59I_42VMi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-30_13,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 mlxscore=0 mlxlogscore=731
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405300133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_105543_234469_E6AB7674 
X-CRM114-Status: UNSURE (   6.44  )
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

On 5/30/2024 12:27 AM, Baochen Qiang wrote:
> Currently there is no dedicated log level for WoW, so create it for future use.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>

As noted in cover letter reply this needs 2024 copyright. With that added,
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


