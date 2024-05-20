Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B780C25B77
	for <ath12k@archiver.kernel.org>; Mon, 20 May 2024 23:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IEiyZlZruIvNa/evEkblI1ovgzTNM+aWfOgSrCXxeo4=; b=TMVjpQRUUoCYz//TsPeKQUG6VA
	2zQMWqoFuMVnJfJsZA6Nci9TRbYhtuHvJrGT6BRmWqVKepeL7MeWhJ8KvjpEp2ljLtLK4ySLNQzX2
	oD5VAP8VT2NG2l1hKVuS13tKplAs/Ikzggurzu6LLZk7nZafNgHQP1OBGWnRrtG5TsLvtb0FE6SjH
	t4rKCTQ02Jd+nTNn6JITIw2QVcv9spBtW7Dm4XHK4Pgaj2cy7Yny58YNraQrYt7/lGJaA+mkoMKq8
	V61D5BAiFstBUIEDbbtyUwoHn+EJuErZ6c0VV+OVZVqVDCMK6k1YG7ydpF44b4MPWewKZsR5NQrYQ
	ITPLM0eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Cah-0000000FpX6-43Dl
	for ath12k@archiver.kernel.org;
	Mon, 20 May 2024 23:38:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Cae-0000000FpW9-2sQu
	for ath12k@lists.infradead.org;
	Mon, 20 May 2024 23:38:50 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44KCGOgW009703;
	Mon, 20 May 2024 23:38:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=IEiyZlZruIvNa/evEkblI1ovgzTNM+aWfOgSrCXxeo4=; b=ne
	rVsNQjJ69YsXuVXlAGfK2ZDv/4p0bqWLkhuv7uH7nc+duXuAvyj1xhK5Y9q1Qplj
	lEDsT6Yvc1Q4wEIKIgzyCRG/hGVtkMdiOzI5OMAJ9JWZzv29q9mNrutJmg0rnscI
	24riGbIOiLRjZEjcaf5byTj/Ay0z001EJBFHkG0s9OAP93HMwenNIPmGoq+OddDv
	gVDmJ67sEP/vz7fI54nCFOIc+YGPNyIS8FRhWmpJqoBh/UlN/4RB7yD3FP5tPFlG
	w650KNv8ltdzWUCwiH/Yr2iq3NbVxGGSCJnZcEHGzbm7AzjoVYUJ5MKKR2vaCuUf
	yNvWSVqFigI/8GxwHCng==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6pqamcqv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 23:38:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44KNck4A024030
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 23:38:46 GMT
Received: from [10.110.17.44] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 20 May
 2024 16:38:45 -0700
Message-ID: <e2522231-ff94-4917-bb47-bb970c309582@quicinc.com>
Date: Mon, 20 May 2024 16:38:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] wifi: ath12k: change DMA direction while mapping
 reinjected packets
Content-Language: en-US
To: P Praneesh <quic_ppranees@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Baochen Qiang <quic_bqiang@quicinc.com>
References: <20240520070045.631029-1-quic_ppranees@quicinc.com>
 <20240520070045.631029-2-quic_ppranees@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240520070045.631029-2-quic_ppranees@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: RMxhMCsJP5Ms-9WhWlKaO7YdrajPrq9n
X-Proofpoint-ORIG-GUID: RMxhMCsJP5Ms-9WhWlKaO7YdrajPrq9n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-20_13,2024-05-17_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=669 clxscore=1015
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405010000 definitions=main-2405200188
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_163848_765434_FD62AAEB 
X-CRM114-Status: UNSURE (   8.86  )
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

On 5/20/2024 12:00 AM, P Praneesh wrote:
> For fragmented packets, ath12k reassembles each fragment as a normal
> packet and then reinjects it into HW ring. In this case, the DMA
> direction should be DMA_TO_DEVICE, not DMA_FROM_DEVICE. Otherwise,
> an invalid payload may be reinjected into the HW and
> subsequently delivered to the host.
> 
> Given that arbitrary memory can be allocated to the skb buffer,
> knowledge about the data contained in the reinjected buffer is lacking.
> Consequently, there’s a risk of private information being leaked.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00209-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Co-developed-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



