Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9497AC25B75
	for <ath12k@archiver.kernel.org>; Thu, 23 May 2024 16:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KLbDo2BUgdUrUgLjmRHDmk8Xo/wBDZgUG77lNMmx2Ag=; b=EdeKJU8s+y2kQZ4f+r8ROmRF+d
	NPd2oTGjj33waCLhEJ03LqddALu8r8vuZq0u2OHQz5c8TTwu03M363tOC17O1GSMzV1Nkl+EjluNH
	df9sgxf4ApMlt9mRGDs5kGJ0wSn9leifBY/T899ZRj+LPeCpb3P2yotxhYR/gy1kdufScUl4gcR32
	rSvMTplGebFUq3JmBcF3hGEfuOGaVNVTAykXf4o34bZbFVtZR0sNMmnaWXFDBPlWP1m2P/zAUYuoy
	WL+tpN5ZXQpSRi7com7nEXk/b6wc74c/42fS0yMozpxup7jMdY0yspH0GZMZ6kHZSPCqvVFNB4Kob
	gITC1UzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sABT6-00000006npV-0acW
	for ath12k@archiver.kernel.org;
	Thu, 23 May 2024 16:39:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sABT3-00000006noc-30FB
	for ath12k@lists.infradead.org;
	Thu, 23 May 2024 16:39:03 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44NDcX6R014500;
	Thu, 23 May 2024 16:39:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KLbDo2BUgdUrUgLjmRHDmk8Xo/wBDZgUG77lNMmx2Ag=; b=RpVxGEGoq0voJRgJ
	FYndCdO3X9Rj+cSQX7/DcL4NyvH0YmgMTyy03sRQ37+3Q0QY+tLmO4Eha6Vntfrw
	4vNypicdWaIfyJmgN1JodroDxKhx0TP4DXzqsvLW5NwhJV8YYdFRDSyeHmkHiyYA
	2NoI66+ETsG4iE5f9lQTPZL92J4zJpKhbv6xiPsWJJIpw9lxxSpvVjdEeN3+algy
	FrHnUmz2rk3DDG8neIBjvZlsPug5q60rpRwFwMsaDJRFtSpHDaC9VqexxjgEpWOX
	f/00n+sXf8pve0DTWOCImM88SUSwr+AVoInwzIukCF2kIe7FZLIYl8nAbV6elCn2
	LuRwnw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y9y20hrh5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 16:38:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44NGcw41025000
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 16:38:58 GMT
Received: from [10.110.17.44] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 23 May
 2024 09:38:57 -0700
Message-ID: <fed84044-d53d-4409-8994-3e9f136e673a@quicinc.com>
Date: Thu, 23 May 2024 09:38:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] wifi: ath12k: add basic WoW functionalities
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240523033143.21677-1-quic_bqiang@quicinc.com>
 <20240523033143.21677-3-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240523033143.21677-3-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: PvdZXiQ0oE-n75vC7GCaKsoFx6lEMNm6
X-Proofpoint-GUID: PvdZXiQ0oE-n75vC7GCaKsoFx6lEMNm6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_09,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405230115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_093901_942642_39B5B7CF 
X-CRM114-Status: UNSURE (   7.48  )
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

On 5/22/2024 8:31 PM, Baochen Qiang wrote:
> Implement basic WoW functionalities such as magic-packet, disconnect
> and pattern. The logic is very similar to ath11k.
> 
> When WoW is configured, ath12k_core_suspend and ath12k_core_resume
> are skipped (by checking ar->state) as we are not allowed to power
> cycle firmware.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


