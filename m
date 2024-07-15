Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E34CBC3DA4A
	for <ath12k@archiver.kernel.org>; Mon, 15 Jul 2024 17:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rSAYiJVhN7ts5cjIRTZf2D+6y9s7u1fSwJmnJ9xUxuo=; b=wvbc0GTXhpXdR6uh+29+SExky7
	yWC2/k+Q9SuXoEkeYjBEG2x293ePDE4avJOPdyrBynfodNCrgVdu0kkoMrMc0mP6awiYQXJny0CaF
	v5CGtY9Y6gvE77sK+aOHdh50PPcmEM4jdz3Vs0zaK1uIN0NcpbmRFwJQfL0v6EeP1WlQS0zKpXdsZ
	zNsx4WMlAocpHy3oQDYHMtihqnXb/rTMVqyJDAv+UH7iwCy/hksSKxS/QFItUys9OYewkTlJyoWJe
	Vld3ub5IZn9HVRgArnj1EF/fyPlUbExWGVmHWSepRdk03jTj/x2gE82jTxCMOtjRLfPtHfacgNV7V
	oEQHJSZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTPYY-00000007szn-2KRb
	for ath12k@archiver.kernel.org;
	Mon, 15 Jul 2024 17:32:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTPXv-00000007str-1Ji3
	for ath12k@lists.infradead.org;
	Mon, 15 Jul 2024 17:32:08 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46FH93wS032057;
	Mon, 15 Jul 2024 17:31:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rSAYiJVhN7ts5cjIRTZf2D+6y9s7u1fSwJmnJ9xUxuo=; b=p12Jbe1ZNk7Y5xQN
	bhkgichgU/kdivtNJ3dGJeVL3OZr1ve3nWIXMXO6App604UVT/ZZBHuANPAUJKVB
	EUSSyczepHcoE7AAUnf5m46G5UmQs/kN1yOI79jygbYwlmv6LSxdUYhkLho1NAbl
	ZR8UMJ1zSZDoGIAWi/O6e5QjT9i67KXQY+Onf+dmMeElWMZ9PbCRyUTU0MGVq5mO
	MEKmaqDOu7IzeU+b6DJ5d9ghl3/7Z6itPngeOFG/5dxeEqNMggroPRDpR23gC2xu
	brOF8NyaLUltzFXXtPHtLY0gYu+ppNsYCmUbWrALds7hG/LOkgOmje+0b53jJd6n
	Pxf3Xw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40bjrjcsgs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jul 2024 17:31:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46FHVTa1032734
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jul 2024 17:31:29 GMT
Received: from [10.48.247.129] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 15 Jul
 2024 10:31:28 -0700
Message-ID: <47d0d6f2-ca36-4e56-8019-ace2304d40bf@quicinc.com>
Date: Mon, 15 Jul 2024 10:31:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix invalid AMPDU factor calculation in
 ath12k_peer_assoc_h_he()
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240710021819.87216-1-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240710021819.87216-1-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: KPoEqgOtw_4zeWuoGstG-vCaX33iNKny
X-Proofpoint-ORIG-GUID: KPoEqgOtw_4zeWuoGstG-vCaX33iNKny
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_11,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 mlxlogscore=999 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407150136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240715_103131_422639_11EEC731 
X-CRM114-Status: UNSURE (   7.18  )
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

On 7/9/2024 7:18 PM, Baochen Qiang wrote:
> Currently ampdu_factor is wrongly calculated in
> ath12k_peer_assoc_h_he(), fix it.

You have 70+ columns for commit text, use them

What are the user-visible ramifications of this error? Just curious if this
needs to go into 6.11 via ath-current or can wait for 6.12.

/jeff

