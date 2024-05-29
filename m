Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB60C25B75
	for <ath12k@archiver.kernel.org>; Wed, 29 May 2024 18:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kujre1iGGAvnBM/XAmXTj7gERKqKCqvQXUoL/RtiuBI=; b=JFho0z4pmILtOSofnlarK6t5No
	3zzMnlscMDEUhBbf3b2iQkVGml260DCugF9q+xpI6t1M8yaates72hbeAaw1FW1uU6hndeHVSkKPk
	RCJR1wE61+QVMKW3ozWkcjzFFYHP7EslQxYT1d1xcSF0OSzIatIuLkSn4hwvKwvq/o2C+mpAiAA9Y
	Mhaj+jRWcHSOyIriJvg2hVi8HVI83U165N8IdzEhv3o4wFsfXEbO5rMJGriBMYWF3R+mYQaihDuTO
	9aDEhxp9MlH9MQpjId666ZTQXw9ne+1irK0EvMKq3IMmyV2AFyZv79Lmh86W3qGH80wog5/vD3w81
	auDGouZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCORQ-00000005G4o-3zOk
	for ath12k@archiver.kernel.org;
	Wed, 29 May 2024 18:54:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCORN-00000005G3o-15dh
	for ath12k@lists.infradead.org;
	Wed, 29 May 2024 18:54:26 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44TBPRXr005587;
	Wed, 29 May 2024 18:54:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kujre1iGGAvnBM/XAmXTj7gERKqKCqvQXUoL/RtiuBI=; b=JUMeHRpTE6bA2HBg
	GRWmDCfZGaF8OTCcd7hsRN+uzz220echYrbRjNkxWqx7hxzJYoaOanV+pKDtn+at
	ny/g8fx6ru9FeFRlsk37lu70vpBwpIC9IsFL5k0fH12rdlLT6Y7rm4ZTVj3ZLwag
	+4ojAUtMxITDhycedVrpCVqGUDtRfgoeuPCY7Vj1VKD7was2QkgWUnaGbXhI5OxJ
	QzrQ8U7ngO6bZlkeCHtLhwSx2GTfEg5CynQZyrMhKrX3HdJSVDRFDe0Kb1KR/+op
	AB8UsWhWcc9LVMoyHq0Nz7U6qWsCTKqZ3OpyjcDSEArlEPV53cZ5gJp2r07+8bvX
	5MbWGg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0xa28a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 18:54:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44TIsMoI019545
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 18:54:22 GMT
Received: from [10.110.109.163] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 29 May
 2024 11:54:22 -0700
Message-ID: <e78c215f-4d6f-49e9-ae06-97b21ed0c273@quicinc.com>
Date: Wed, 29 May 2024 11:54:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] wifi: ath12k: unregister per pdev debugfs
Content-Language: en-US
To: Aditya Kumar Singh <quic_adisi@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240529043043.2488031-1-quic_adisi@quicinc.com>
 <20240529043043.2488031-3-quic_adisi@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240529043043.2488031-3-quic_adisi@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cXUFwGkIJHq2NgD_PkngALVzd9PPjrdF
X-Proofpoint-ORIG-GUID: cXUFwGkIJHq2NgD_PkngALVzd9PPjrdF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_15,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 mlxlogscore=771 priorityscore=1501 clxscore=1015 bulkscore=0 phishscore=0
 malwarescore=0 mlxscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2405290130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_115425_454502_B27C6549 
X-CRM114-Status: UNSURE (   7.02  )
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

On 5/28/2024 9:30 PM, Aditya Kumar Singh wrote:
> During normal de-initialization path or if any error happens while
> registering the hardware, there is no support to unregister the per pdev
> debugfs. Add support for the same.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


