Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F45606A329
	for <ath12k@archiver.kernel.org>; Fri,  6 Nov 2026 14:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m7fJol6w;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LjOtuIDV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j7dNuuHU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qboeitKXtC/ct89Obi6R+XrF8lt4qTTqD4J1BPDmL80=; b=m7fJol6wG5OB0p
	+cn+/Hf0GHS8SSn/yfrAZe6jWogkxktjeDa7/3M6bpHOslOH/tr7HKt3MibTCmme5mMMhnNSEmnuv
	iD5by82Xrov/ZfxN6fZXBBsuNk1qBWuy7c7OAc2c0ZAhJKk4ExeH/0yg0hxwn7xI2/HSh6UvkQdiG
	ObLHUYjXwivJvjfsbGwe4fDSb3UDaYzGMlD31qYNDCbic7pQ/RTYqPZYRjCWIyzjzJaiGofzvZddm
	BTe5b/LghE0lNczi8Z03tAD0qICF+7NFh0FqaPiJfW2Hs1af/EfPLN6VWNvBMz5u6Pdj/eot2/Q49
	7quX1hUAzfGO6kw+EP3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKyl-0000000Cfqg-0LTr;
	Fri, 06 Nov 2026 14:31:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKyg-0000000CfpC-1yyv
	for ath12k@lists.infradead.org;
	Fri, 06 Nov 2026 14:31:39 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6EQ9Kb612692
	for <ath12k@lists.infradead.org>; Fri, 6 Nov 2026 14:31:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qboeitKXtC/ct89Obi6R+XrF8lt4qTTqD4J1BPDmL80=; b=LjOtuIDV6sRjD92N
	7H8s4sCuCODz0mIII3apvA8KSBgYUHOHKtC13oJM6GBPNQaPjQVms6cHGzLVIlHo
	7nVl7LsxMjEizQGMaByVyDtfh8Fm0WCnmp0e0wBw6szVUetRL/1hQSi7g2XKCqY7
	5rkK+dUwv2xVdOv+HdPEQ6a17Iv5N9UDBKFg0NFIqk6BgbxV0xXDjN8xrrt5xYHn
	RFVXN2R6kNrTst2xxgh7Z8ykYFFSjRImAzDdRU53Et3i39egiIBEK9CA4yuCjZrj
	2mv7wxHpDNNVKpQP9kdIMbsRaLs7WOJYu538GBubQ38x08/ZpQfswjHu1PQtZB9W
	csuFyQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pb34wu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 06 Nov 2026 14:31:37 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so1554143eec.1
        for <ath12k@lists.infradead.org>; Fri, 06 Nov 2026 06:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793975496; x=1794580296; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qboeitKXtC/ct89Obi6R+XrF8lt4qTTqD4J1BPDmL80=;
        b=j7dNuuHUCdvMyc2GXnuFRZ+jTBAr9o6j8lRIIHH0B4NukXKxBlLAiwJzROPDUtBym1
         J7/8zuZXKmKV//PWpvribprrGlgnTv0+Bv9Z3lJj1VahKRVsHUHGpAfafWGYVgCQGXsM
         f/SOVUiVUnKzyaaW1elg5VnuuKn3iECloXQfT6udezTWqsbEWeZCVmkq3Ojy9ve5xtD5
         C/8d6EiqKQB1ZTK+KWArcnwG7KY3qqa1zOFI0MroopzzuvqtDy/JlSH+Dz1n+Q9RUCLN
         ZBPUkL1E7OfKO4Yl29ogAA+FQJId3LonNnvSS+6VxbwbDBn99KRQ67OC/VRrSMncTveo
         POgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793975496; x=1794580296;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qboeitKXtC/ct89Obi6R+XrF8lt4qTTqD4J1BPDmL80=;
        b=uRA/KMjPSR3PcK2PkVHo2g7bNEiRGPRCXRX50OesBl0ZAG7iE5edr9QcTKHQYFyB9+
         vjcPvF1+rMnwF1QyqHCyiYnsmN8YjBrnocI5A4bScIhH7dLOSiiAi3XWusxAHvwGUxfz
         +Be0fjHoVn45jg/1Qke6QSZ32Gl5wrkhkz5P5jU0RcTrGD12OFKQTWhPSYi+8NY+TcLv
         AZga/wYiGRznlCITa/ZHE4ANO3IlvVF2paJZvQlRKkLF/xO3QWgCdl16lbHLy8NubmX9
         z7iIXa+m8QT2QGodr+0Q/CS1F7MU4s5ZT6mH+8zowRZbIUJy1698LZsgYEVOAd0htpvl
         LsNA==
X-Gm-Message-State: APuU4Z/83M2m7iMNS3v9zLs7zuCyPR11nagyX2Sjf4oaPi1QJQ/EMpdy
	VqpJkQPz2XIvzhDGMOr3nue7RWqZXK+KjC1OIv4U2gPwwELLhfVYCmSZ1jwNWLjlONnbvSgn3mc
	6dTIYdxHZpEMn0dHWTB72xt7AWzfExokVUsT8a+utrWt83yrXAAyM/IRbwgi3LlyoHx5VXhZ5
X-Gm-Gg: AYBFou1JHGglyDoK2eXKKMATCNBXAQYPOHa8IW5xN10miiCmsah1NSi1YKTaWxI4BEV
	4z22cAKEisXnmZG6EZ1PCBY5GIlL1eoYkoFPXWXbqG6w7yOqKTPIl1vMLoXZPHb3d4PRUxkF9QS
	cOwvWw1tRpnAl3ZwM0SJOqHk1eEnzTv4qZmj77qDaTZkzy2lyTPhEO39yYbIZ+hVjuuhChXCJRi
	QX+kuYKLV3WFmEBU7fL1Apyv89sy9w1iXJAO5NKfvEveibNqpGA17gYMrWkUguCCM8cwldav1mg
	5EWgCZgkdpesJQZ41O4jVVabwElD+0GRME4jwzAz0wYdyAxy8U7TnPphqVUo/zd5yH/np/XYRIi
	f3EqtfS3seRpEFDG9ihAG/S0U8KiW8OH1xhxdeFQPWK87R/eicIleE4BjdsCIjZJnO5qlSzqFEa
	GsG/jFerKIL7NlF0owNhsuYTBCFEhHaJE=
X-Received: by 2002:a05:701b:2205:b0:16a:b995:dc7c with SMTP id a92af1059eb24-1b25d34efb3mr2989538c88.21.1793975495934;
        Fri, 06 Nov 2026 06:31:35 -0800 (PST)
X-Received: by 2002:a05:701b:2205:b0:16a:b995:dc7c with SMTP id a92af1059eb24-1b25d34efb3mr2989503c88.21.1793975495150;
        Fri, 06 Nov 2026 06:31:35 -0800 (PST)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9ed126csm7361711eec.18.2026.11.06.06.31.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 06:31:34 -0800 (PST)
Message-ID: <01da3719-51c4-4f0d-a3f9-f0e5c95dbb80@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 06:31:33 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Issues with ath12 wifi driver on WCN7850
To: Rahul Balakrishnan <rahulbal29@gmail.com>, jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
References: <CAMOo2XeHzsWR_f5j1+ukPn97CpSNtPM7WLm1Y8cWqdGm3=yJFA@mail.gmail.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <CAMOo2XeHzsWR_f5j1+ukPn97CpSNtPM7WLm1Y8cWqdGm3=yJFA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UrFukyT0zr48cCFGwM5zMha8R_Rfxwzr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NyBTYWx0ZWRfX4ozaP9mzwoW/
 K0ty0D8f/r4uJD0sSXcelFtbdLauE3/8gf8mUmdYd1ptSp+0GAkUEP5vv0Rb+rqsSRCR8AA7BwI
 le2Hz9ib6xMk1Tqy0rWbAFPu6GktwwY=
X-Authority-Analysis: v=2.4 cv=LIrz05W9 c=1 sm=1 tr=0 ts=6aede4c9 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=1nzeiQ3qHfAZu2nQ3WIA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: UrFukyT0zr48cCFGwM5zMha8R_Rfxwzr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NyBTYWx0ZWRfX0IiQfY1Gu28U
 mEk3zsbsKcgCjay7v6ueZ8Nh3sUafqI+MdT/sJJlRa77bVHkOIsdSvOO7IwObSS5Hsm7N2WC3tl
 VLHkHAm8iSk5/DlQbO+aReoZjB3G7gR6XCNB+AA1/dQp5WliZE9MKOWfc35c7nXNoj4JHe9+CRg
 4cZHf2m979y1iPV6QCvK+w4yxRDCzjJa5qNHJ9M9i0kx1GY3JnVXg1gyRY3VLx23fKwjlHyrz1z
 NVt0odZMzYYKkDh+wKWEiF5ntemhra2CfHK0QKks3e93TA4U3yzyG7dMqsFj/gEXPAMqyd/lCxh
 rjHhdgLmt6jSoqBS2OKDc0Fn0nxfMJyDTjCynCXsaDr93RgJLvcrk10jsQBF8opzhArBtNNzcea
 fgAKqHSmoVw9QJfQRBz8Vde0X9f4I9tXRRTUmoU/kkZqrJk+Ma9dRvRsaNpt8lr4EijMgcmN+7E
 h+wz0U6LPp2IGB/DMQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_063138_633135_83F04DA2 
X-CRM114-Status: GOOD (  10.29  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/6/2026 4:07 AM, Rahul Balakrishnan wrote:
> Hello Mr Johnson,
> 
> I have been encountering an issue with my Qualcomm Wi-Fi chipset. Here
> is my currrent system configuration.
> 
> Environment
> ===========
>   Board:     MSI PRO X870E-P WIFI (MS-7E70), BIOS 2.A52
>   Device:    17cb:1107, subsystem 105b:e0f7 (Foxconn)
>              "Wi-Fi 7 Hardware name: wcn7850 hw2.0"
>              chip_id 0x2 chip_family 0x4 board_id 0xff soc_id 0x40170200
>   Firmware:  fw_version 0x1103006c fw_build_timestamp 2026-03-06 09:10
>              WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
>              (Arch linux-firmware 20261019)
>   Kernel:    7.2.11-arch1-1 (Arch distribution kernel, not yet
>              reproduced on mainline)

We only work on the mainline kernel here.

If you are having an issue on a distribution then you should go though that
distribution's support channel since sometimes they carry their own patches
which are not upstream.

If you are able to reproduce using a mainline kernel then follow:
https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath12k/bugreport.html

/jeff

