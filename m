Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D30C48297
	for <ath12k@archiver.kernel.org>; Mon, 12 Feb 2024 18:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EJ236RSJh2JONZt11QtRVcZlbpwRlVn2jBMn8/Ch+oY=; b=zhT6vkPG2khDjuLw4cbNvBJhRh
	Wm2YYrBjk8NrnUAyTiGMo84dwQXoimuT84Ctq6tqakgCqJmOFK28M+1MAAZGgWVDQeHfJRG8gzIJ5
	TMi/8N0JQ/a16gT8CubdT8hlL+NGHFxCR52B2aGgi4CfS9hJMsBmnaCCt0Bsd5S2k55Qn46tVFn28
	KebOgFLm4VYHZPUewEpUumVL2xclSiiE0JAAJgOLDi6OGzqdny6NJC8WXEmF+PJuCzStHxZMijgVi
	FAZgR2YWk3iHpbqj+KMXG/69zEC4GKn+mUKCqkcCNZleaOlvilF3F8yh9Io09ZfteM5BKJe8dE2BE
	xBbfzqww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZbOU-00000006gTz-0jx5
	for ath12k@archiver.kernel.org;
	Mon, 12 Feb 2024 18:51:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZbOM-00000006gRf-3NZV
	for ath12k@lists.infradead.org;
	Mon, 12 Feb 2024 18:51:01 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41CIfFc6022119;
	Mon, 12 Feb 2024 18:50:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=EJ236RSJh2JONZt11QtRVcZlbpwRlVn2jBMn8/Ch+oY=; b=kN
	NzN/DNo72RoNzpOgs33IlvzGm5xwc79HACR4UEp100BVc2qwvW/5a4ux4n1PSzE+
	N+omk4y89ShzDt6vz5wQOVsxkwXJo2qJbTj8S9QZLV7eaVFxiJMn/9q55vIGdAJi
	nsPZMyfPEe6Nn3gdOMFuy+qKCM78XPqg4iyu5bn2MBiJnyDQ20sFAU9P1NXGJfsQ
	D7mi1WFZ8HHvwGnTFWiaUSVU3FDOdzb7JcEQZhMpbyGttlot1OYhu4FWQB1or0O8
	B5mS22pReBxAkHKE/l3DhIew+MLedvgDbz39Q+84ej18EdwKI44craPd1+su7BXe
	rZ4ftp7uWmQHD0I0wJcg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w7ju78ym3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Feb 2024 18:50:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41CIoswK029775
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Feb 2024 18:50:54 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 12 Feb
 2024 10:50:53 -0800
Message-ID: <11a06acd-1049-476a-92a6-a9fe410aa5b6@quicinc.com>
Date: Mon, 12 Feb 2024 10:50:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath12k: Do not use scan_flags from struct
 ath12k_wmi_scan_req_arg
Content-Language: en-US
To: Nicolas Escande <nico.escande@gmail.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240211145548.1939610-1-nico.escande@gmail.com>
 <20240211145548.1939610-2-nico.escande@gmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240211145548.1939610-2-nico.escande@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: hrL2Leay_qXiWbtdfEfTHsWlGvf326tI
X-Proofpoint-GUID: hrL2Leay_qXiWbtdfEfTHsWlGvf326tI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-12_16,2024-02-12_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=391 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 malwarescore=0 suspectscore=0 phishscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402120144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_105058_884538_662C60B1 
X-CRM114-Status: UNSURE (   7.22  )
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

On 2/11/2024 6:55 AM, Nicolas Escande wrote:
> As discussed in [1] to fix the mismatch between the WMI_SCAN_XXX macros &
> their corresponding scan_f_xxx bitfield equivalent, lets stop using the
> scan_flags in the union altogether.
> 
> [1] https://lore.kernel.org/all/4be7d62e-cb59-462d-aac2-94e27efc22ff@quicinc.com/
> 
> Tested-on: QCN9274 hw2.0 PCI CI_WLAN.WBE.1.3-02907.1-QCAHKSWPL_SILICONZ-10
> 
> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


