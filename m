Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 298F9C3DA79
	for <ath12k@archiver.kernel.org>; Sat, 13 Jan 2024 01:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JHTG3Jwe+cOCjjOc0p59EAqua/KLLZfr6DJYkisd0rg=; b=Hhj1ioR27fvR4PXcFV9I/d/DCg
	hvVQTLSPuNVqbXYCTTdaK1ELN1gG3oHOQh90LuMCF6ESALezcvQrYvSzDF5WYjxRIO6M2Q7wDR8QE
	I02GGy922H9zeoMiOn02yWmJIEUUqdmkeAOaDtbxXyPVrp/VsWrYJdgHivFXYgRbFbbuarY9aVJsL
	oWONZ4Ex3iz7GFAfCUVAMFXr9uD+FHWA8QlKYVp5EXMmhWnmsJ+XuK+MP6tphxFwSPZ4zjOllvX1U
	zKDjZvPZ8Ej5GXbv321ijmZrNnqcUhpqoQkNiHh8dmkNHDcVPJMI08WZ7aykJgTFtZA33j9d8xZxl
	wK0/YLOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOSlr-004OEB-2g
	for ath12k@archiver.kernel.org;
	Sat, 13 Jan 2024 01:25:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOSlo-004ODg-1T
	for ath12k@lists.infradead.org;
	Sat, 13 Jan 2024 01:25:10 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40D169gw001763;
	Sat, 13 Jan 2024 01:25:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=JHTG3Jwe+cOCjjOc0p59EAqua/KLLZfr6DJYkisd0rg=; b=CT
	lN20uN0QVgx1dXhI9L0oCeWiEIzfYyEiD/lRcuHn4+ElBPahdSrPXAqx7TgThUmo
	M6uMKKdkvAW3hPlMkQaJ6Hq8Qv4/WvJaM8UMxdEQpDsMabhurlPVL5Rewpdmejyu
	2Yfr7vaAQiVU3J5Roou0cGFYXvaMVRZj00qWPiDnN9KGNtmnjx1yu5hZO2oP7FB+
	Wma/NIFx7waygjYC+V+xkGONP1yQy5smHvLNvTT1otcaHSn0FCH1lhoIpi0ycJQc
	Q7ICOAUb9W4QO+PozB0Q11sBWF0KEGWPCHrIPmWRhMpKaCoW2Vfk5p8jgnKFNHrb
	01Kwi2dVjneXUeH0GLkw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vjymnak04-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Jan 2024 01:25:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40D1P6Mb032362
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Jan 2024 01:25:06 GMT
Received: from [10.110.118.97] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 12 Jan
 2024 17:25:05 -0800
Message-ID: <1104e483-69eb-458e-9271-6be799c6178c@quicinc.com>
Date: Fri, 12 Jan 2024 17:25:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/10] wifi: ath12k: change WLAN_SCAN_PARAMS_MAX_IE_LEN
 from 256 to 512
Content-Language: en-US
To: Kang Yang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240112092824.7664-1-quic_kangyang@quicinc.com>
 <20240112092824.7664-6-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240112092824.7664-6-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: nULs9SXmOwKfpv5zy1jDPkV_TBS9R0aj
X-Proofpoint-GUID: nULs9SXmOwKfpv5zy1jDPkV_TBS9R0aj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=852 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401130009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_172508_669222_F1D30608 
X-CRM114-Status: UNSURE (   6.35  )
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

On 1/12/2024 1:28 AM, Kang Yang wrote:
> Mac80211 needs more space for P2P scan ie in P2P mode, 256 is not
> enough, resize it to 512.
> 
> Also delete the duplicate macro definitions in wmi.h.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


