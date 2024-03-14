Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90248C54E60
	for <ath12k@archiver.kernel.org>; Thu, 14 Mar 2024 17:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pTtSjWKFKZP3xkIxwHYHegWCYf186jtawsiTSAEXtk4=; b=mR7WjkCOlKekDwGyZ1auROJq5B
	6kAWVD6IovXwXieMA8ZYW5GX2GkaKhIrUf1irSlaglsuNntIwV2vi1I+dKKJqc6KfPaoL6eMGlfth
	jr7L2M3y/36np4w34vpjfTMVotJyJVSsu6M15FFyFig3UTkS2Vz73hgBvdF+V9QpAJ8qE0NMrNWAR
	ihTT/eAfyzCD0cJrXmcct/TjzgHlH0rfVVFiie0/q4WDAt4P0O+Z1hGDoXxw+eNcg3Sac5M4mxd2f
	B30zyOfh4kUCAN24V3H9xyOXmKiKmHWrJJQCWH5lr+uuDKuVRWqZSH1aDhrEAe/8hcTRSpRJJyBNS
	t2cKCWkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkoyd-0000000F9bi-0kH7
	for ath12k@archiver.kernel.org;
	Thu, 14 Mar 2024 17:34:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkoya-0000000F9bQ-1La0
	for ath12k@lists.infradead.org;
	Thu, 14 Mar 2024 17:34:45 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42ECulQi001886;
	Thu, 14 Mar 2024 17:34:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=pTtSjWKFKZP3xkIxwHYHegWCYf186jtawsiTSAEXtk4=; b=kx
	d60uLpfD0/6SlTBxCwDOCg77/MTd9YJk1PI6roJmIqyI5KqGM+FPicAfMP9hbQad
	QyPoLon4ABPRIO8rtEg/di3iwsGhcqBl7S0vZrsNGqDWdhvRhB2T9l8MytKJRgVM
	bQzV1P99pyAt5x8XV+nhCqrsPNV0DgDDil3h9pC97YLhlwrw+V8SBKOLx017Rj4r
	2IchYV66mBxBg8ZEP1HUwAZgHQhJQ1GSliUBcF9iY4UQc6n7YNUuQZhDV2yMiQ+M
	kL91oQdOk80ZYTzjFrUYCX2EArglSHFTL1+KzoCljMSjlehUT+WAjU/RznymMaRB
	mW+rPOHAXILYwqtrc16Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wuruqswc1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Mar 2024 17:34:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42EHYgRq026118
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Mar 2024 17:34:42 GMT
Received: from [10.110.27.195] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 14 Mar
 2024 10:34:41 -0700
Message-ID: <a5c0877d-90ca-4661-8080-12a528422772@quicinc.com>
Date: Thu, 14 Mar 2024 10:34:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: remove duplicate definitions in wmi.h
Content-Language: en-US
To: Kang Yang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240314021830.305021-1-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240314021830.305021-1-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0PZvvTJjI0rf1pbHB3UORvJT5VAYWO3g
X-Proofpoint-GUID: 0PZvvTJjI0rf1pbHB3UORvJT5VAYWO3g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-14_13,2024-03-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=654 spamscore=0 adultscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403140133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_103444_403353_47366C84 
X-CRM114-Status: UNSURE (   6.06  )
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

On 3/13/2024 7:18 PM, Kang Yang wrote:
> There are some duplicate definitions in wmi.h, remove them.
> 
> No functional changes, compile tested only.
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


