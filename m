Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7B9C61D85
	for <ath12k@archiver.kernel.org>; Tue, 21 Nov 2023 00:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vH/MEtJEbmn5drXn/29HdSK2bi7CavkeHK3tz0qSE70=; b=jWca8D/CQRQeob
	2Mla9UGzSqVjZaQCYbpsqQoT9xjlHEDeVzlNh+I/qII6FQ55JKaJkm7FRSIiXIiidbqWPwLVQBaSm
	IKdoxaR98xTBqHSs0+eCOOCBpYKz0vVBNYW96fS8aMavmz0qbLQBdDkoX5mjJ0PS6HZWLMWdAGGun
	JYg3iAX98iZX8cwICWlTmxEurK5ZZoH13nX5ruoSzPb9jZdwBew3fp93KZe/ahroWM3OHr6avsv6u
	YWwcpp9feV1M7ecXn1WwpL6suOZ06QW54SYVozuISS6AGOWo4lgweXOhoPpnEik7IlZ+UOhFjlS45
	ew/xbm4SEIsKrykpg1Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5EpZ-00FFtW-2Y
	for ath12k@archiver.kernel.org;
	Tue, 21 Nov 2023 00:41:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5EpX-00FFt7-0Y
	for ath12k@lists.infradead.org;
	Tue, 21 Nov 2023 00:41:32 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AL0C2oO025597;
	Tue, 21 Nov 2023 00:41:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=hja+Vk8uwZic9pm0nwLPmiIIPeEmGvnjR0Rvf6zX9J0=;
 b=pkO8GMz5gKFfgelne4QCwbmBwBK+9+ZbDPxuG6r8MMgqzIGKNyt7NG/qWBTyb3ylCMt5
 3OvOypp9DZje2Qer75D71ipSZYANCkNAu6xdwsVXUtg9/0z4mC4gZZw0ruHFcYx79tdh
 2ojN8+sNT5MkFFQBMQ6J07AXORmo0+Q3NY3Tg0Z/lueBxdl0pzMXkpYfCVNdxnlRy6TZ
 BucqwpbQbPBreJQkkuf9CUMTo41wO795KvJMSCyNpCfIweUdpOKfEHM9DUdtBJLfSRvL
 9X+snRk8Ya6bqZJWwwE6K+igX972JfVu/mG9/r2LuNfRqopUBtyep8FmmTqE09QEKDts Nw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ug2axac69-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 00:41:30 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AL0fT7a029183
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 00:41:29 GMT
Received: from [10.110.116.223] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 20 Nov
 2023 16:41:28 -0800
Message-ID: <fb2f4684-0f72-4ab4-975e-ff54fc37b9ec@quicinc.com>
Date: Mon, 20 Nov 2023 16:41:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath12k: Optimize the mac80211 hw data access
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231120235812.2602198-1-quic_periyasa@quicinc.com>
 <20231120235812.2602198-2-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231120235812.2602198-2-quic_periyasa@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bsugHk6lafj4ZoODW2otDPcl3Hp2syFc
X-Proofpoint-ORIG-GUID: bsugHk6lafj4ZoODW2otDPcl3Hp2syFc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-20_22,2023-11-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0 phishscore=0
 mlxlogscore=496 impostorscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311210001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_164131_346440_1E95F545 
X-CRM114-Status: UNSURE (   9.86  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 11/20/2023 3:58 PM, Karthikeyan Periyasamy wrote:
> Currently mac80211 hw data is accessed by convert the hw to radio (ar)
> structure and then radio to hw structure which is not necessary in some
> places where mac80211 hw data is already present. So in that kind of
> places avoid the conversion and directly access the mac80211 hw data.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
