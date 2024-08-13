Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF9FC52D7B
	for <ath12k@archiver.kernel.org>; Tue, 13 Aug 2024 17:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7DPn4V7xZH3wDuP8mYPCm8T5/CIOvrFsoU8orG75UZY=; b=wAn54zckoVJkeBL7mcf6HpXoG5
	GFRErcgljdCKydZrRMeV20yUzNrQlhxn5CoA2Rta7NAikVY54jMYy0luFMYgdtc1NDs769aTcsYPW
	lQqN+RIoniMh9LwP6l15Hg+2TezGi1tkXPgIYtYrsycZu7YjeDvZdHn0ZrFeBOIMY3sAVmOM8/U2r
	sys+gHD5mf/eEb75Lt3HisYuWQM5vCazdUqrUZ17v7jxEVRUJeuK6ydlsV+pL50W/xgO02Ipn2aUs
	5RJVM0gVKjqAL3lG4/ukqr/RuYcSbBh39mhLXRDE7UmTKQao14czqEaejJYRBDB5bmsU8CuikK25B
	P8uMkUTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sduy5-00000004ST5-3kaJ
	for ath12k@archiver.kernel.org;
	Tue, 13 Aug 2024 17:05:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sduy2-00000004SRs-41z6
	for ath12k@lists.infradead.org;
	Tue, 13 Aug 2024 17:05:56 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47DH1crP026758;
	Tue, 13 Aug 2024 17:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7DPn4V7xZH3wDuP8mYPCm8T5/CIOvrFsoU8orG75UZY=; b=QkI07sghUWuVcVEB
	KXRJkdFYFMeH/FeQQfpx/ChEZT9bHkz/yd/Bsl3pveilc+4lq4t6PAYE1xx60oZJ
	1gsb+WxV/ZwTTymKoZQzBwqEKPmAry2HV3KWFhWm0uLTbfs+E8sljTOCpiPWkXKF
	pEwQDD5Yk/BGzm3SkkgrvZeMFckrG0/gTX1Rr6dPhrClDcd1d3VubWXR9Ftsi3AE
	jsakImaAbPPAYJH7WJDsTu/gPI/IJ6qMDyV4MCTj75+PO8dM27HGQVhV43+DWFeT
	9cHajJMbMkuIkcTAanMUD1Cs4q9sL3tX+xiaYsMKaKdPaGdRNagQMw+zTqDuYxEP
	spgmqQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 410437ss93-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Aug 2024 17:05:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47DH5qhd008050
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Aug 2024 17:05:52 GMT
Received: from [10.111.178.117] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 13 Aug
 2024 10:05:52 -0700
Message-ID: <53e9f797-5db2-4ab3-9d06-6ae9bf6df29a@quicinc.com>
Date: Tue, 13 Aug 2024 10:05:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] wifi: ath12k: Add support for reading variant from
 ACPI to download board data file
To: Lingbo Kong <quic_lingbok@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240809025055.6495-1-quic_lingbok@quicinc.com>
 <20240809025055.6495-5-quic_lingbok@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20240809025055.6495-5-quic_lingbok@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Ud8s9hkVFV-8ZVe_QGhhMPqoLvoP17gj
X-Proofpoint-GUID: Ud8s9hkVFV-8ZVe_QGhhMPqoLvoP17gj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-13_07,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 bulkscore=0 suspectscore=0 adultscore=0 mlxscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408130124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_100555_176578_4EB70E1C 
X-CRM114-Status: UNSURE (   9.87  )
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

On 8/8/2024 7:50 PM, Lingbo Kong wrote:
> Currently, ath12k does not support reading variant from ACPI board data
> filename extension for downloading board data file.
> 
> To address this issue, obtain the string of the ACPI data filename
> extension and use it as part of the string to search for the board data
> file from board-2.bin.
> 
> This patch will not affect QCN9274, because only WCN7850 supports ACPI.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


