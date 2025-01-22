Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20CE9C02181
	for <ath12k@archiver.kernel.org>; Wed, 22 Jan 2025 10:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uh5V6M/NjV8X/SaZn8H3TleQnN/GlTxxidIJqM410tY=; b=Lorfc4RXYMu/tIbXngJjCFE9Rs
	ulkYCMQ17IEHnKnL/+1Vrv+WKM0m1MrN2VhxhuBs0fZXLnbidCsfGaSHaE4VRbrFa5OfvdDK/Wytg
	N979U40j5uBxhe1k/E1lmd5ducH0ja9E9OitdjYK8XrBmu8mMFGbvanPnI/SElLAEARgt25sogprp
	Jp+Zos5ScK2kEVUwebGYWvaJHDGYEAEUW8HLgzSM3BJkchA7pp9K6Ly3W1OXg7vyzawt6XCBx+vsS
	BUhYCEsg6V5avqCVybkOPEuY7fC6gAY6aoR7c2iGk+b1IsEKY7bMQy6TAlxqFxrGjkjhF8hVjx1nQ
	Os5KLndg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taXmp-00000009uo3-3hx5
	for ath12k@archiver.kernel.org;
	Wed, 22 Jan 2025 10:16:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taXmb-00000009unA-3BQW
	for ath12k@lists.infradead.org;
	Wed, 22 Jan 2025 10:16:26 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M4Z4SJ019857;
	Wed, 22 Jan 2025 10:16:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uh5V6M/NjV8X/SaZn8H3TleQnN/GlTxxidIJqM410tY=; b=GUkFJPe5SaA2rtju
	JrgwBuvhowJ/TV2lJBvFi9tD1RhOmD99pyKRwfCaFWhFR3IMrdNb69xI80GGH/Tx
	/HoJY43Uoj2eNb2xavgqhsmcNbPZTRW0NEh9jlG4Fl5e9ydj58IE9S4LjkWzOKT8
	7YQBHTRdATdmqlRpRXgWyn/pm0cYHKFKOEGX2Qa5JA5ZiF+fQvtrCVdjazlGZb3q
	3yMLGkuCqucSQkLJ/uCihmP/YjpC+43VNvJjj0fKL+/nF/WlJBQfxSMiSj+gElP7
	mFce6n2xz9BJLl+aJe8Ob7rapDNozf7q7OpURD+C2rQV+g55Qn0bmqcCg5iDnanA
	qXqW+A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ass6gseg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 10:16:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50MAGDtX030294
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 10:16:13 GMT
Received: from [10.216.8.24] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 22 Jan
 2025 02:16:11 -0800
Message-ID: <42f69fd0-4820-403a-b6d9-2a822891ca06@quicinc.com>
Date: Wed, 22 Jan 2025 15:46:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/4] wifi: ath12k: add configure country code for
 WCN7850
To: Kang Yang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250121104543.2053-1-quic_kangyang@quicinc.com>
 <20250121104543.2053-2-quic_kangyang@quicinc.com>
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
Content-Language: en-US
In-Reply-To: <20250121104543.2053-2-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BWKnYJCFAjMqJLgHb2xui8_9sZyv7UmX
X-Proofpoint-ORIG-GUID: BWKnYJCFAjMqJLgHb2xui8_9sZyv7UmX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_04,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 mlxscore=0 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 clxscore=1015 mlxlogscore=904 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501220075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_021625_804408_59D75691 
X-CRM114-Status: UNSURE (   8.79  )
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

On 1/21/25 16:15, Kang Yang wrote:
> From: Wen Gong <quic_wgong@quicinc.com>
> 
> Currently, WMI_SET_INIT_COUNTRY_CMDID is used to set country code for
> WCN7850 and QCN9274.
> 
> But WMI_SET_INIT_COUNTRY_CMDID is not the correct command for WCN7850.
> 
> Add handler to send WMI_SET_CURRENT_COUNTRY_CMDID to firmware, which
> is used for WCN7850 to update country code.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
> ---

Reviewed-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

-- 
Aditya

