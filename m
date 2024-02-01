Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BACFFC48286
	for <ath12k@archiver.kernel.org>; Thu,  1 Feb 2024 17:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hMseBjvnrHHdYkpAWPMC6Hdkqi93CwHfnUYtxaLgv38=; b=ZcUN5/yJ0la+OEiZ7GBNWjBjnG
	/R1zKBOzzHTiHJTKJCu5gRyrR8qw8c1rBr0IncgF3LFJgYBvchErH0CKMgDhh+4WZ4rNoenSrrbCW
	QhJKsmNXx+CABMqZMxD5NMXQBZKT6kwWjUEUTtvVwcBa+jAjCrfuI+KOiySswL3yJnpj3tyrMlbs/
	JQPZIG0vO/Jn66xdYZ5L7pcPmbiPJi9BA12bNEpV4iM/KDQsrTRnyJAFtMVYEzz68QghxkoGOriL7
	M3PSUVV/ImiSlPO1Eu7cr5xzUdsjs7OGZITsFVyopYERs8NTPpo/N7AY5CodNPnN8z2RTxm+nEHLH
	B3uAC19g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVbB5-00000008rCA-1woc
	for ath12k@archiver.kernel.org;
	Thu, 01 Feb 2024 17:48:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVbB1-00000008rBQ-3SNj
	for ath12k@lists.infradead.org;
	Thu, 01 Feb 2024 17:48:41 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4116PjSb015836;
	Thu, 1 Feb 2024 17:48:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=hMseBjvnrHHdYkpAWPMC6Hdkqi93CwHfnUYtxaLgv38=; b=m7
	4nb8nb1i40q+t2ffOjs5HrTYB+FmyZ0uwjuK88jAa7NTgWz538KGJH8tn7chTwt0
	ZXJne8xpvje16V0IawZypQVHYnhkMqsrxD0kcyP8w1MKSSkiZCeO/BriMlVOVD92
	kx1TF0H/5LhhCtJ1QXhm4kjdlYvFUmhOflI+tMbVGDVcfB7ZjsNriwJIQsGVSPEb
	yu3x5AZ6FlV6Uy6AkdJdjeLrgZJiDL5BalaZBd8F4S2roOQIgYdGbmU3A057HCqk
	nCvpDd7eaOUPQDJtTD3tzlt34nYB+740tUKSob4JypOFSdRcfu45lYCrz9NzB1sM
	q0wF73x2sq81ERRACStQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w0619hra3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Feb 2024 17:48:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 411HmbMx016436
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 Feb 2024 17:48:37 GMT
Received: from [10.110.16.197] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 1 Feb
 2024 09:48:36 -0800
Message-ID: <4e2a7ca6-af6c-4e69-905b-f27e1d34a001@quicinc.com>
Date: Thu, 1 Feb 2024 09:48:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: enable 802.11 power save mode in station
 mode
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240201035830.2534-1-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240201035830.2534-1-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: M1MN37zIpTFZvpOniqxPv0GnMVRv4p2K
X-Proofpoint-ORIG-GUID: M1MN37zIpTFZvpOniqxPv0GnMVRv4p2K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-01_04,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 mlxlogscore=359 malwarescore=0 spamscore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2402010138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_094840_019377_92AF12FC 
X-CRM114-Status: GOOD (  10.11  )
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

On 1/31/2024 7:58 PM, Baochen Qiang wrote:
> To reduce power consumption enable 802.11 power save mode in
> station mode. This allows both radio and CPU to sleep more.
> 
> Only enable the mode on WCN7850, other chips don't support it
> for now.
> 
> To test that power save mode is running, run below command and
> check there is no NULL Data frame seen by a sniffer:
>         iw dev <inf> set power_save off
> 
> And run below command, then check there is a NULL Data frame
> in sniffer:
>         iw dev <inf> set power_save on
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


