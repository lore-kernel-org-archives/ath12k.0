Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B7ABC25B78
	for <ath12k@archiver.kernel.org>; Tue,  4 Jun 2024 14:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B/96BTw+xkS3lQkxH7j6xdN90NrdAqBAODbSG1NhDP8=; b=KzAi0qqDRubCJudnvrsyJtz+XY
	lJfdpX3b1wwOGYgl2FOE8pjuODABGoFDmvT/+n8fKE5ASp8YFKbfR3v3SHGy+gtmUkheO5t1mrfWj
	Tn+3OhAPS7jQSyDWmATGFXRTv4+BNnphn8Pdhm9aSTFl10HxqRh50z/gReE29RTWUJ9rUToQlEEFp
	IN/ZzjwrlCZJbobPHxPEC6IXPoRl4eQc+GikkjKst1N8OI9Yd5RS1Q6INsUai2G3/oQLIot779O8n
	BsTczoo9T0Uxr5VwhLp91rAtKmcy9f2geynBT/NTaisU4ef7F708G7eMVaQd9Ow0O0IBUAsrinq9x
	0SwPMzsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEVbT-00000002pxD-1DZ2
	for ath12k@archiver.kernel.org;
	Tue, 04 Jun 2024 14:57:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEVbO-00000002pu0-3tYR
	for ath12k@lists.infradead.org;
	Tue, 04 Jun 2024 14:57:32 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 454A9bSi024997;
	Tue, 4 Jun 2024 14:57:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B/96BTw+xkS3lQkxH7j6xdN90NrdAqBAODbSG1NhDP8=; b=YDr+FSqbz4+6K6lO
	F4a++Y3TLD5U4fU8oN+p/l1Nh01tpkmAkCV6PCGhKSEbo11/doqw5e6MOqWhYIxy
	mo3qTpeSnswkYbrizgT+QW42nq3KFTHvn4JwVjZ61V0FV7kYpx1GjCuH0jcUTOZI
	95XY+2FoYljm6JYxk1Q/ty3/WrJcyHBVBcagGSbZ2d3EVH9g0rLiiq2gxO3cDxs7
	NrYNWzD66QcsxERIZs+Z8B5lYWco7F0v6y0+Zqx6grt0vpJs+cfKVty7q5vOHHqT
	ir2Lzml2Ztu0cHHbFYAfhlrzeKZrWy2w2PlQlKMyDK/4yLgKWYbI3XjLgjdxlDzV
	lqhSPQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw5wq1v2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jun 2024 14:57:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 454EvOe8012295
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Jun 2024 14:57:24 GMT
Received: from [10.48.241.109] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Jun 2024
 07:57:23 -0700
Message-ID: <b10a0ba2-6085-4a33-9215-87bdfcc6a895@quicinc.com>
Date: Tue, 4 Jun 2024 07:57:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/8] wifi: ath12k: support ARP and NS offload
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240604055407.12506-1-quic_bqiang@quicinc.com>
 <20240604055407.12506-7-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240604055407.12506-7-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mNvpcQOoMGoTYqQPsvpmokxrhQa2Stwg
X-Proofpoint-ORIG-GUID: mNvpcQOoMGoTYqQPsvpmokxrhQa2Stwg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_09,2024-06-04_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 mlxlogscore=566 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406040119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_075731_025811_14238A01 
X-CRM114-Status: UNSURE (   7.15  )
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

On 6/3/2024 10:54 PM, Baochen Qiang wrote:
> Support ARP and NS offload in WoW state.
> 
> Tested this way: put machine A with QCA6390 to WoW state,
> ping/ping6 machine A from another machine B, check sniffer to see
> any ARP response and Neighbor Advertisement from machine A.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


