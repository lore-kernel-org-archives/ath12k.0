Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 561B3C3DA6F
	for <ath12k@archiver.kernel.org>; Thu, 24 Aug 2023 04:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AQU1/ziAF+PUrPTx7F4dqharIkJvfvHVDxwraYRog74=; b=Sv57AoVuTI4XsJ
	k58yEB/eD+m4uRpZDCY+W40M8KmDraZZb2qNT6DR+c3uYDob810DgwolIH925pNKqwz7P0vt3BP8J
	Nkw7Z2/S0htk30xPsPLXEYSnbjqMeu/OkKVqUlARurLzlk5cCed64GhSRuaI1V+d0B+hb52rkHJRN
	0lNaL/j+qsCh8TeYtRUhcHbMwIFUBZ2USAFL1L2ogbv+FN4bVjiJlcSBMid9LajoQPiOIypS2yrIp
	cHd1aMkNd/T47A8vyFUxbsCP8C5nCjtfW/DXzuHGCyk07PfUb4pLY3SMzoCBeM+g7YuCKF8NY4TBT
	erPyK5ugC6Xx3ZlmVMFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ1rq-0028be-2Y
	for ath12k@archiver.kernel.org;
	Thu, 24 Aug 2023 04:22:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ1rn-0028aj-1Q
	for ath12k@lists.infradead.org;
	Thu, 24 Aug 2023 04:22:44 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37O325Nc012263;
	Thu, 24 Aug 2023 04:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=/CZOywEz+mWvUXFGFOzI5YGSli17Ewawcs0aLcbDr6Y=;
 b=JdkhjL6lPqcnNcue+9c3UZk4vwIkecfLyYzGoYNBqjFu270N68Qgo2nVKbS1HckAYKUz
 xEylcaxGOAPBLz1KPRyjfHUPc6Lb3pYvvMSS4FBsii8JWjeKMnCAwVSlUKM3oqCwS6w6
 y76su3nJIVU/G4srNidwNxTc2h21872IkJweVMjdxbBOLb8+jP4Qw2l7t5gUKmSpniWR
 W5JEPRAqUYtP1aiqybJT8Ot/FJS8XfcGDseu0s/sOpXYHYQBt1VLUVhisnrtngnXxa6a
 HVcGa5l9AV2gaFwknAL2dg+sDoRr+lk7MhD0mxxH14x3FxcRw+hv8klfX9nMvoUwqV22 IQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3snwkjr7mk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Aug 2023 04:22:36 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37O4MZmw002932
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Aug 2023 04:22:35 GMT
Received: from [10.48.247.99] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Wed, 23 Aug
 2023 21:22:35 -0700
Message-ID: <e544defa-ba43-4497-8f43-c109f0c8156b@quicinc.com>
Date: Wed, 23 Aug 2023 21:22:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: enable 320 MHz bandwidth for 6 GHz band
 in EHT PHY capbility for WCN7850
Content-Language: en-US
To: Wen Gong <quic_wgong@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20230824025432.19406-1-quic_wgong@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230824025432.19406-1-quic_wgong@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: n7zm4ZLXuFhsE67YI7cS5wMYsDdf-UYP
X-Proofpoint-ORIG-GUID: n7zm4ZLXuFhsE67YI7cS5wMYsDdf-UYP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-24_01,2023-08-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=666 mlxscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2308240035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_212243_654286_E6DD1586 
X-CRM114-Status: UNSURE (   7.61  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

 > wifi: ath12k: enable 320 MHz bandwidth for 6 GHz band in EHT PHY 
capbility for WCN7850

s/capbility/capability/

Kalle can make that change when he submits to -pending

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
