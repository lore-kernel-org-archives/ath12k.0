Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8863CE7AA5
	for <ath12k@archiver.kernel.org>; Thu,  5 Sep 2024 23:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fSgMPN1c02raEzlgzGBazhQOzmSp38Je+Fm2RQX34uA=; b=iv9ddFtBt7o3fuUuSWfP+iLL1j
	ob1Z6dek9wJD0/YXJHYg2L49ZpCWayuEeCZk4Gja2tkv+uaGbLsY05xF1bVsqi2PDMkoktshj6QaK
	bmAJ+hsrnxzhzhq10JW6wjsuoHZWZ/MJsFGnxZIuVCFmSFK2pAXgvLGZbbvMUo7FWUGc/u/oP43Eq
	FqOmL3eJLn7g3t+nSBg3aj78K12UXQxJSGdpXRHwll/L9Z9McJSrkMEiRsglpbV+7cwxC00FTo0ux
	l3ng8iLO84zMwq5/svLANS/kkna5N/wm3hEaSz/0YVafxRQHtSAWPE3dKRjxg4eOtOvJfPNE+uEc6
	Cn/KxNiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smM4V-0000000A8Lo-2Lec
	for ath12k@archiver.kernel.org;
	Thu, 05 Sep 2024 23:39:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smM4S-0000000A8JZ-2S2r
	for ath12k@lists.infradead.org;
	Thu, 05 Sep 2024 23:39:26 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 485LuDSG018213;
	Thu, 5 Sep 2024 23:39:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fSgMPN1c02raEzlgzGBazhQOzmSp38Je+Fm2RQX34uA=; b=pCd2DdyJMs54SWKv
	xRpodZ1jx5h5XAnlGib6y/ZKcb9Du9X0XDy7momFX9fDWVOXqEe3i0h80xGx8WVM
	vn6SU9ctXP5C15hWQKATgq2N8jf8TquGNUSVFgKBq/ZdfScETIsvCLO9Rn+aEM3k
	x4mbI+SNXpLMcOyapwy5dMD3XNZIfkm/C5qFblRL1AcRmKba0LZv6SS6uCH26BHc
	QOfG0ITz46Mni2mOTn6TDTtD5sEdrP7cdZFSdSiYory9EfEOseZHTrbNaS2pczmS
	HNu3qACiA2CIJsnzX9UHrHqJX+UFe4ybw64S55nDqle/Fe+KAIVZlHiWMbEVZWoA
	wrgYhQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41fj09rhbx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 23:39:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 485NdMQr018741
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Sep 2024 23:39:22 GMT
Received: from [10.111.181.108] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Sep 2024
 16:39:22 -0700
Message-ID: <4343b13f-e549-487b-86f8-b2e72db663a9@quicinc.com>
Date: Thu, 5 Sep 2024 16:39:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] wifi: ath12k: store and send country code to
 firmware after recovery
To: Kang Yang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240905023511.362-1-quic_kangyang@quicinc.com>
 <20240905023511.362-5-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20240905023511.362-5-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: F9sZbwTFB4BYwe9F3AghPjVPM1x8H9Nv
X-Proofpoint-ORIG-GUID: F9sZbwTFB4BYwe9F3AghPjVPM1x8H9Nv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_17,2024-09-05_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=876
 impostorscore=0 malwarescore=0 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409050177
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_163924_812514_1C31F52D 
X-CRM114-Status: GOOD (  11.29  )
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

On 9/4/2024 7:35 PM, Kang Yang wrote:
> From: Wen Gong <quic_wgong@quicinc.com>
> 
> Currently ath12k does not send the country code to firmware after device
> recovery. As a result the country code will be the default one which
> is reported from firmware. Country code is important, so ath12k also
> need to restore it to the value which was used before recovery.
> 
> This is only needed for platforms which support the current_cc_support
> hardware parameter.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



