Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BF2CED242
	for <ath12k@archiver.kernel.org>; Mon,  7 Oct 2024 21:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yVDSPx6cXwuYsEAcMa9+AEfdYg+qCvtyRFW1/8tXxvM=; b=np023V/Lf0OLXYg/0bSppF6K5h
	4ecNMaqK/c65LZYBg2mWvOmmEu2Kf2JBWPa260nzu5bln6zqZczbxpAIy9zOxsUEuJBkHESWjujT5
	JrJej2xv/d/HnV5D5IK6WJrmO1D4GtqMEynqWMk0nr6Z2ndzrfqc+k7nTvJ2yIj4wyRxnaDSMGBID
	mD0Q1XABScNaJfZ2IcJd6+E9kXxQf99SOIxWIvyUyukVZ5uUe3xjWNfSEN0eENhTGGfszNaJf5x+a
	IpFItUzPsNDfmxYKYPP1+27CE9VoR8omZeEsSNeHWoFm9/5yobz1CsGuvYGp6eeCrfpTvuSiQIqoV
	MKNF/mOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxvVh-00000003rIm-17ho
	for ath12k@archiver.kernel.org;
	Mon, 07 Oct 2024 21:43:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxvVf-00000003rHl-0HSJ
	for ath12k@lists.infradead.org;
	Mon, 07 Oct 2024 21:43:20 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 497ErML0026919;
	Mon, 7 Oct 2024 21:43:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yVDSPx6cXwuYsEAcMa9+AEfdYg+qCvtyRFW1/8tXxvM=; b=Zv8Zb1DkaBBBIYdm
	RikhO7uR3sdkGPaatmJTBk2cvMaaTAa/WFtFIx4sLSbqxwkdGOItep+ukY6fb6bm
	WSLEy9zYsoOVSuLvwLhsRvdCg1ZJ3UbJVBBcxk4eyyh0E0E+hHVcuL58awAFj6R8
	y+5DC7D2/0Qe/vNYzxRHz7URg1NelQvM6/Qp5N930UisYGx9Ijl8e+nZvzNcEt/M
	n0sAysWJ+rbUACSV4Vmd5j/A2d/RVe6+x5FMPXArNkTFoit+FxEkKSSr66N/x9p0
	TgqyjJe1lgf3Crkox3dQOrvD+SkotHKrfp0qys2AE9Eh7G6vzW2+mz146/jBIG3g
	MFAkMQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xq9wcy9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Oct 2024 21:43:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 497LhDFa030138
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Oct 2024 21:43:13 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 7 Oct 2024
 14:43:12 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        "Jakub
 Kicinski" <kuba@kernel.org>, Kees Cook <kees@kernel.org>,
        Paolo Abeni
	<pabeni@redhat.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        Arnd Bergmann
	<arnd@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>,
        Rameshkumar Sundaram
	<quic_ramess@quicinc.com>,
        <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
In-Reply-To: <20241004095420.637091-1-arnd@kernel.org>
References: <20241004095420.637091-1-arnd@kernel.org>
Subject: Re: [PATCH] wifi: ath12k: fix one more memcpy size error
Message-ID: <172833739297.2581613.4397682908224722962.b4-ty@quicinc.com>
Date: Mon, 7 Oct 2024 14:43:12 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: xv8KleO3pv__tTsy16lyVkRdlU1eV_Cx
X-Proofpoint-GUID: xv8KleO3pv__tTsy16lyVkRdlU1eV_Cx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0 mlxlogscore=684
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410070149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_144319_150602_54A4A436 
X-CRM114-Status: UNSURE (   9.39  )
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


On Fri, 04 Oct 2024 09:54:13 +0000, Arnd Bergmann wrote:
> A previous patch addressed a fortified-memcpy warning on older compilers,
> but there is still a warning on gcc-14 in some configurations:
> 
> In file included from include/linux/string.h:390,
>                  from drivers/net/wireless/ath/ath12k/wow.c:7:
> drivers/net/wireless/ath/ath12k/wow.c: In function 'ath12k_wow_convert_8023_to_80211.isra':
> include/linux/fortify-string.h:114:33: error: '__builtin_memcpy' accessing 18446744073709551610 or more bytes at offsets 0 and 0 overlaps 9223372036854775797 bytes at offset -9223372036854775803 [-Werror=restrict]
> include/linux/fortify-string.h:679:26: note: in expansion of macro '__fortify_memcpy_chk'
>   679 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
>       |                          ^~~~~~~~~~~~~~~~~~~~
> drivers/net/wireless/ath/ath12k/wow.c:199:25: note: in expansion of macro 'memcpy'
>   199 |                         memcpy(pat + a3_ofs - pkt_ofs,
>       |                         ^~~~~~
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix one more memcpy size error
      commit: 19c23eb61fa4c802e6e0aaf74d6f7dcbe99f0ba3

Best regards,
-- 
Jeff Johnson <quic_jjohnson@quicinc.com>


