Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A53BCC10F1A
	for <ath12k@archiver.kernel.org>; Thu,  9 May 2024 17:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hGhlYYMkE6EEQUkImt5bUmMJAw+zzPezAGduNWNo6/4=; b=n32m4cEQDS9uSVc9G2Ab6omAtJ
	DBDMUByrcgpjBLsQxNFAdSAtdhN/FA7eJmq1wchArMpPy9dI/nGC3ZtLoITurgfyIrgAZDXjisC2t
	ETphbwP23H9EJInIzJoDOpHityuL+SKUMCLVYPrwHxI/WqkG2eVBJS1Zb+TSoL7cKHnf1pFaCmRrS
	E6Ytrd7SAfaCBtrUpGwVaXQCcfzTfth8aXQUbJh6RDPS3LcdF0V4X8st2SfutghPuFDYQWmQQkyxF
	2AhgMhgoMHr+Bb5g6allBRcpxeqms8Ux+y9DaHWaxoon2L1HjUTuE+0uegKGnPX8SYcNytRhksTEo
	IpGAqxbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s57dc-00000002FHr-1X5G
	for ath12k@archiver.kernel.org;
	Thu, 09 May 2024 17:33:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s57dZ-00000002FHI-2YSm
	for ath12k@lists.infradead.org;
	Thu, 09 May 2024 17:32:58 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 449EfmhI011743;
	Thu, 9 May 2024 17:32:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=hGhlYYMkE6EEQUkImt5bUmMJAw+zzPezAGduNWNo6/4=; b=RN
	Jr5Uz43/6Lz5gscCb3FenkBz7ODS3SesXLn5KNPZ2Nod31uw3LpRkzH6oB3OZVTk
	H/JGgg3iiWfH61vqa4a+64+H4Glnrjwy5nB9z99q0uGMT5Y2O95rpZLkMbXNaiN/
	ras1lDzywIYEf+iuH3MU/orjxpeDA9Nkz2dkGbEqiIL3Ql8tW0t16Z1mLitoG4Ej
	2M2NKwr7+A2YTvMhOy+Vq55k+krNl2n8ragc9mVhNkEDiy6TUzxzHhci3LwBAtxd
	2CXQdyWIfCbjYPSddFxaTtS+2SZvvXqT8cJV87HhSzQqF7OCVyPEC4NXXwWvr3HP
	F0GSQb4iDeRSx4lakQMg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y07u0kfem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 May 2024 17:32:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 449HWsMF005846
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 May 2024 17:32:54 GMT
Received: from [10.110.102.9] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 May 2024
 10:32:53 -0700
Message-ID: <7153876e-2270-4bca-a47a-d45ca165fa34@quicinc.com>
Date: Thu, 9 May 2024 10:32:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Fix Tx Completion Ring(WBM2SW) Setup
 Failure
Content-Language: en-US
To: Nithyanantham Paramasivam <quic_nithp@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240509161631.3520506-1-quic_nithp@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240509161631.3520506-1-quic_nithp@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0UP56Y_jhbZ5ndXUSV3mz-bA1HpXwewl
X-Proofpoint-ORIG-GUID: 0UP56Y_jhbZ5ndXUSV3mz-bA1HpXwewl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-09_09,2024-05-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=656
 impostorscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405090121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_103257_693380_4F685552 
X-CRM114-Status: UNSURE (   5.12  )
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

you need to version your patches

