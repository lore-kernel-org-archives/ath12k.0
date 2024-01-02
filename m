Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E144C47074
	for <ath12k@archiver.kernel.org>; Tue,  2 Jan 2024 15:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WH/ybcYMMgYaDUTtkQUjkQiZrqsnIAxhUCtLVk8HJMI=; b=07K/MBGbOdo292PfATlpz/PneV
	HC8aUzpeAEjMgApM63l0w2T4n7HcsDUeujm5wY6zJpHEhsp/48o/MChOED6VKtUjvany+fqqso2ou
	OKSpEQ9Qm1OSFks6dT0gHZZaz+OL7wSNfClnPD0KQjaoHnvSQ7ZmQIDz4whZGEwJpf0V1XfQWx9fn
	bQBE6yojmoksuOtXAfPk+MYMCBqKjKab0eivLAdxCkl2Ugps1ni38KykdzjGuKOdnjYHERPe3NZHu
	CTS1rJqefcOvfr1cgYu44wHAKndoNOdQ3W2XuEnYHuWBsXmJ3gD+R3buckSlnldG0zve5tPKwQtj0
	wRs5KsYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKhAA-008QbK-37
	for ath12k@archiver.kernel.org;
	Tue, 02 Jan 2024 15:58:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKhA7-008Qal-22
	for ath12k@lists.infradead.org;
	Tue, 02 Jan 2024 15:58:41 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 402FdOTm007528;
	Tue, 2 Jan 2024 15:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=WH/ybcYMMgYaDUTtkQUjkQiZrqsnIAxhUCtLVk8HJMI=; b=ky
	x4bSU7NjTdxij6rbVsApaFrDC/ekK5tD82rvuOsGhRTlLIBoqURFXp8qFpgwKuDm
	WTWjlHFNDAvOocyPMzik8OqV+U9TY4mVSy8rZwP+X8eGESBv0u3dF5AFEQP9jqWU
	KVGyOniK2ocyfltBFEvPxD3A8eTpSdeWmMECEI/GJtBLXF3dxfbUBpiK5Tlo3rQd
	9OWx1tuwFU/OlqjdmlnZwuRhdL9/2cnC5msZHCocWd/VqsJI2oVo4TObLHbzw19e
	A113pegEjYM0r+z7vF/a1U8m2hlescQGLiYXI7EytcYmfqilw+1OzC2KmMSKFu+t
	oWI4CQ3P40BpudxeC4bw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vcets8ssr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Jan 2024 15:58:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 402FwalS016101
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 2 Jan 2024 15:58:36 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 2 Jan
 2024 07:58:35 -0800
Message-ID: <f86c953c-0f7c-41e0-b563-4196d15b58a8@quicinc.com>
Date: Tue, 2 Jan 2024 07:58:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] wifi: ath12k: report tx bitrate for iw dev xxx station
 dump
Content-Language: en-US
To: Lingbo Kong <quic_lingbok@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231225080723.9518-1-quic_lingbok@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231225080723.9518-1-quic_lingbok@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: n-43zyJmCng6Xd4j4J10q3_vP_QUpyJF
X-Proofpoint-GUID: n-43zyJmCng6Xd4j4J10q3_vP_QUpyJF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 mlxlogscore=670
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401020122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_075839_703730_933A7854 
X-CRM114-Status: UNSURE (   7.64  )
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

On 12/25/2023 12:07 AM, Lingbo Kong wrote:
> The tx bitrate of "iw dev xxx station dump" always show an invalid value
> "tx bitrate: 6.0MBit/s".
> 
> To address this issue, parse the tx complete report from firmware and
> indicate the tx rate to mac80211.
> 
> After that, "iw dev xxx station dump" show the correct tx bitrate such as:
> tx bitrate: 104.0 MBit/s MCS 13
> tx bitrate: 144.4 MBit/s MCS 15 short GI
> tx bitrate: 626.9 MBit/s 80MHz HE-MCS 6 HE-NSS 2 HE-GI 0 HE-DCM 0
> tx bitrate: 1921.5 MBit/s 160MHz HE-MCS 9 HE-NSS 2 HE-GI 0 HE-DCM 0
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


