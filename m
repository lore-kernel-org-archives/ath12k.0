Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F01AAC54E58
	for <ath12k@archiver.kernel.org>; Wed, 20 Mar 2024 20:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SoZ2PW7G20OgJRJOmNL1B+KWiE8AzYNZxsthmP2LBs8=; b=p7oZL3I5fg8+NDa0Pgixn3ZtyT
	iLg5WJS8oBz+b/pfc5QhvnmnkFER7gw62HKzQXBPhJbzGKngXek+EJERIta/MZuq2v3C/wSvNdabT
	H5COeeCOJPmsRXzAjAwKhp5+DOetQlQzg0lW9tZARFNotgYkxK+O36t2TmrgmU1XBP04iqeP7bq92
	SIVGzl/gfdNiskPRn0Tl/PCURLAi6Ifqa4l+JrRCeRcBc4IzrRjr/BHjv/EaMGirYlsw56F09SfZh
	aLVjZSCZKZQkBDiTy/mb/wiuyBGuTj0xmWYgdguh80N/g6uoOcDVwZkVbk3NuWgt8CnvjDNyLO7pZ
	yPBR+w6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn30C-00000000y40-2sVz
	for ath12k@archiver.kernel.org;
	Wed, 20 Mar 2024 20:57:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn309-00000000y3V-42ev
	for ath12k@lists.infradead.org;
	Wed, 20 Mar 2024 20:57:35 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42KKIK07031158;
	Wed, 20 Mar 2024 20:57:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=SoZ2PW7G20OgJRJOmNL1B+KWiE8AzYNZxsthmP2LBs8=; b=gA
	9bEPAKGNe4yosNhE9sftGsRdOH9gSuswz5qLt3nCAW+Q3bHBrOkhlMzEJ4CRHwO6
	LDuSFCsXPSQvtnr4RfswxB9gwnFOFK7kcfBpD/EsT9MvINRkdjK3zWP02Zuszdth
	1D/HXxKeACf/wXzTk865VrYASn9EmUWNoujnBXqfYNCAXY0fdyZ/uOjfHuWa702I
	1k70Cr2/1c9ZBozP19TF6ty1Z2b+/iYcub6cqBKDqgTTpT4pvlAUN/8wewl76zsH
	ClLQ+xl7YZczg1TGjp95gSBgPV0oJCWVjLwIM3N3vxy3As+DxL61fxruIMdqzM7h
	qMX/QXfVyMd9oI25SSEw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x01jqgvjv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Mar 2024 20:57:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42KKvUwL009584
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Mar 2024 20:57:30 GMT
Received: from [10.110.120.226] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 20 Mar
 2024 13:57:30 -0700
Message-ID: <7592ebc4-c893-4d7a-936a-f1e00f88a27b@quicinc.com>
Date: Wed, 20 Mar 2024 13:57:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath12k: Add initial debugfs support in ath12k
Content-Language: en-US
To: Ramya Gnanasekar <quic_rgnanase@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Ramasamy Kaliappan
	<quic_rkaliapp@quicinc.com>
References: <20240320171305.655288-1-quic_rgnanase@quicinc.com>
 <20240320171305.655288-2-quic_rgnanase@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240320171305.655288-2-quic_rgnanase@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 157yDBJO8K20aZhri4fpRmRg5kRACSVe
X-Proofpoint-ORIG-GUID: 157yDBJO8K20aZhri4fpRmRg5kRACSVe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-20_11,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 adultscore=0 spamscore=0 mlxlogscore=891 mlxscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403200167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_135734_043314_F90CF05C 
X-CRM114-Status: UNSURE (   9.01  )
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

On 3/20/2024 10:13 AM, Ramya Gnanasekar wrote:
> From: Ramasamy Kaliappan <quic_rkaliapp@quicinc.com>
> 
> The initial debugfs infra bringup in ath12k driver and create the ath12k debugfs
> and soc-specific directories in /sys/kernel/debug/
> 
> For each ath12k device, directory will be created in <bus>-<devname>
> schema under ath12k root directory.
> 
> Example with one ath12k device:
> /sys/kernel/debug/ath12k/pci-0000:06:00.0
> 
> ath12k
> `-- pci-0000:06:00.0
>     |-- mac0
> 
> To enable ath12k debugfs support (CONFIG_ATH12K_DEBUGFS=y)
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Ramasamy Kaliappan <quic_rkaliapp@quicinc.com>
> Signed-off-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


