Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A82C4345F
	for <ath12k@archiver.kernel.org>; Thu, 25 Apr 2024 17:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WrjJHZQMIBwHrFA/rzrIhqUmfSjUkitaRUQRSkxYy8A=; b=dlCWwc9rCZxbhJ8vRKxglPUc2V
	2KT5+2VQFD5CeVOqAMHK4SpodgbYd4TuhL1ZcX0FfwIQbhr4WorTTcct8PhDvJDvIuxDV0ZuC0DKl
	7IBQ/jwqNTj3pQKcsRhoExS5E0eRq/HA6yeoy+4fqlmpeQCuedUP96oNipwsoriKbwJd8hcZkGd3j
	fjfn2qAdmj6674F15mQ7X/Ls8E0Q+4A0cuDwItpOlktOoGDQkRr+gO1jzBNUikTUvxts6sxHzNR8d
	bJ8PO8RH2OA7f8dIyJP6wI+7BTYOh1SQIRwlQ8syo+8HDi/tHrg21NwhgNDeMWpoE0sEscjPan1i7
	bDbLj9pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s02zJ-00000009bZA-3ROR
	for ath12k@archiver.kernel.org;
	Thu, 25 Apr 2024 17:34:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s02zG-00000009bVu-2BGR
	for ath12k@lists.infradead.org;
	Thu, 25 Apr 2024 17:34:24 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43PC6tSo004646;
	Thu, 25 Apr 2024 17:34:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=WrjJHZQMIBwHrFA/rzrIhqUmfSjUkitaRUQRSkxYy8A=; b=hT
	Dj7qzTsRRRq+329yB6tOg4hH9XDlkJB5mD+zYRv0t1Zaszm7RwED2n7J5rPiSq1Z
	KimpOeI9JosB5Zz7HKd13AuAvMmlME7syk/Ky7jEXyTSFabVXuP6BocmTa3oK9VT
	YtDrk+0BwRl3CHrsfJJE8awBKCPqWY6Rj4wzyc6RNq9ifeQMFTfqAPOUeQ69bBYA
	khgRmNzfsTdFMag/d/cMMTPLizWOMP4jXsOKPmhE0x3JHgaC2SyQg8M0f3hnEtQw
	p94FkRa0MrJuBX046s9758as7orB9X1L7n/uhVJFo7ukKMLkyum6g00WZp+QgU+r
	FCJ2XCNU94BN0tYgiIKA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xqenkk9ky-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 17:34:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43PHYDR1025098
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 17:34:13 GMT
Received: from [10.110.61.159] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 25 Apr
 2024 10:34:12 -0700
Message-ID: <08cda85b-e2b2-4c73-a41b-471dec080508@quicinc.com>
Date: Thu, 25 Apr 2024 10:34:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/6] wifi: ath12k: Correct 6 GHz frequency value in rx
 status
Content-Language: en-US
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240424191141.32549-1-quic_pradeepc@quicinc.com>
 <20240424191141.32549-3-quic_pradeepc@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240424191141.32549-3-quic_pradeepc@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: wDi2BfAWhzHs6zqkEC2vfD-_g8NZhudz
X-Proofpoint-GUID: wDi2BfAWhzHs6zqkEC2vfD-_g8NZhudz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_17,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 mlxlogscore=742 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404250126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_103422_723526_F6B870E3 
X-CRM114-Status: UNSURE (   8.09  )
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

On 4/24/2024 12:11 PM, Pradeep Kumar Chitrapu wrote:
> The frequency in the rx status is currently being filled
> incorrectly for the 6 GHz band. The channel number received is
> invalid in this case, resulting in packet drops. Fix this
> issue by correcting the frequency calculation.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>

again this should have been propagated from my v2 review
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


