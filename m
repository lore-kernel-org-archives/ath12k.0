Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76820606A32E
	for <ath12k@archiver.kernel.org>; Thu,  5 Nov 2026 17:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N83PhzwS;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=lyrx1joA;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fL5Qr21G;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dl5O/fEP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ehX13o344Xe731l0KfqPE4oN/274+YlSgpyXzq0Egc4=; b=N83PhzwSp8fHzI
	BomhZTpZaPwpz/RqQsqA4CB1xk3cieqxouT1ky/7N8QvEb4CUiQw9PA9OtZcwZHHIjRkChE20tkIa
	byvmGlEJpIDpCuXwOZzitHit8kWYgSpTghB9pdxlKME3v/nx84bDr1nGVnkylBNoYIW21/pvdxfF9
	b5b9H9PoKs1f9c/yZmCWUMMZl3BtPQVO6bztnn8/PCvJzJB5zKLVBdcW9bLCGsBIqUuw/0JnvkQsd
	d2G6wU/LridZGJcOG9xKLPm+w0wSLU9a7lyRQ0azGc2UvN7SsPnbIbd3TrzeOzovj/5lv7qy6o/WS
	oxIiazWuVD9kt3Unzxmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP136-00000009pWj-0mpA;
	Thu, 05 Nov 2026 17:14:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP11V-00000009ojP-2G4Q
	for ath12k@bombadil.infradead.org;
	Thu, 05 Nov 2026 17:13:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ehX13o344Xe731l0KfqPE4oN/274+YlSgpyXzq0Egc4=; b=lyrx1joAoGxdzdRy1eSujzPTua
	2cffZk1ZXiTajlmxh/p4IbhXYrK3iVfj8mIslX4nNKPVC8knBbd8C72TnJLghntDjQjUxgFX1RKBZ
	Z84WaitnANbaP3Dfxmt12g9h+SqQpSTd/5sHLg1NlbO9O+hTsbx3YL361y+JYF8qFIAaGfNPjS6Ma
	qY0JOD2Do5Q8H7aqwJtbJeLWARwb9l9UPrVozmS9BD4WnwjX3PAfb+GAh7pBMPvZQG1VOtwx32qqC
	x4jrT4t9jwdHUB1+ePx1VNRFqHuftG9iQ/u8YQTPKt/zJKY9MSuL5BvWZeUZnvhJxHTloTETBmLx7
	7BR7KgdQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP11Q-00000003Jo2-1jSi
	for ath12k@lists.infradead.org;
	Thu, 05 Nov 2026 17:13:10 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQDcX3644496
	for <ath12k@lists.infradead.org>; Thu, 5 Nov 2026 17:13:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ehX13o344Xe731l0KfqPE4oN/274+YlSgpyXzq0Egc4=; b=fL5Qr21G6LvfgZjW
	zB71fq0ilSJSJDDYmahlqNJAn47iJ4Q8KOAoADIZWv8ENVqZ0QHoNeV5gpcotNkK
	BQogGF8D0g5+09WrN4YZQrsq2MkGSvrkCmQ6CWWR0h69y3Wq1qizJWXI5qoXWBTH
	Z/qY1NGBda/BhFm7uREiIhjqOn5LBlgcdgg6BSZKpvl5aHNf1G+qcHkvyRtYEp/z
	IzGN1QiTNkniGgw2Woc2olaLOVXXEK4MJKTQB4wl29N4k0+hpncmdDpOr/PN755q
	l/ya2RNKt/E4gBIAMzwpIN+MbjuuraIyGodoxxEXyFk56/tGv/miyX4jpdPIoNXm
	1mNeFg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrrkdsmc4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 05 Nov 2026 17:13:04 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1a71dd190b0so7076883c88.1
        for <ath12k@lists.infradead.org>; Thu, 05 Nov 2026 09:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793898783; x=1794503583; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ehX13o344Xe731l0KfqPE4oN/274+YlSgpyXzq0Egc4=;
        b=dl5O/fEPplxHzA8UwMQ2cHAvxjdDflu+Oe6f/5eS9F4LnK+wYiU1BTvFO3FysZsjjt
         LgHLsZrgXNvSePRHpb8tQe74SG+F8Y9iDfWymMwdbNPjQRbbmEJ40r6LDnuUc4LHXKvh
         VOiPHpZh5RA7EsSSlCnD/zi6W7u3SzHWmFBsSQ01rCwjqWbtTfdQ6ngs3VfyTYIZgl9a
         d0Y9zaYS3Otv4KvvFt7UdahlEIShMhb1m5X2LeQE5MXfRvL5F0foLJdQDMaBqXJwUUGl
         tzVeiiqEZuC3fOAok5uwtxq5W+M8EHlOBSOP1f4EXGwf4oCliEPspVsBM4LzdYHEOKE4
         MWPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793898783; x=1794503583;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ehX13o344Xe731l0KfqPE4oN/274+YlSgpyXzq0Egc4=;
        b=Ssyi4GqPtG0V6PqzOYc5iXHk8IzilQN5Kkszthf21hzuHj+fNDCtoa4unXHaMVHF23
         TB1vtNwIBkXr8jx2vl0gPgwCoBwQz4CaNYYZSQSCddq1EPrbhSsp7j81BwAPtIRSrhuG
         goi4NNGPhjEumWU3IEGlzBEp3yjxl3TWV3MRAa4s+hZG6pjNwOGtPuOi/JzsRMH4XzyU
         Y769faRLa7uH9yJ64jMhZo1550uqzTfzqOx1mSLpow5zuqeyNoACxWgI5aNbeYizhuyG
         jMWiSYIEr1peKkDI9hpNtzHD8t0UfBgMs9R6B2D+cqXy9thdbUzHGkWHlyDSihx8NvBY
         uyzQ==
X-Forwarded-Encrypted: i=1; AKwUvBwRRUQ8Mgli2lfz4fgbIQucx3lHixbQ79ramYIsPfAY9A529hXR3tEoZFApLU6w8eulWj6NOO0=@lists.infradead.org
X-Gm-Message-State: APuU4Z9Wbx3Xt3VzS5bVG5OLin5SBhDltcs2OOfWvSsG1X+2GUvy0epi
	CvFStK/3JS4ZroebeOSwY450ZvWI18IfDRFd8uZi4gh1fbjTpNaBtqDg+UXuFl4IpqyNW6BMEhl
	uDAgqv2eCKipdJxExHSQgv1IYAHb2pBkqP4ZA8TLxky65eY6s1cDROiaDyWnK0C++
X-Gm-Gg: AYBFou1EL88yVdah2GghAqHdeOOmzY3qxl6m8dT7zWt1MNYau56LqLwwWOc2tWKUulI
	1cx6/ExgqCQrArOZJMuWnTsRkfm4Qvn3E/wkTYgZmzEmYhaZjVTNW9APpnaiyaDkMzEduSJvZsJ
	5WEf24P28xM4nk7S09XBk5SscgSLD60CV3FjJ81vcgiWYOAAqaDhM7pEcrI/ugEJPn1ygLT6zUw
	Oi2iruyakRdF222oMMcbsxLWi0mPMoVB+HPBfcbrjjklh/C0UNpoHr07y2SJ1jrrQRaMd9PYG/f
	RiTJu2wkaEfMj5/L/mhE2949UMaxjKUhWsK/gpHy08UtNQrJvdo3EPO3RTtSCah4Hgsicck2Wjj
	Rtp++4xr/sCFF29pOCvJfb9dCK9uKHnMVvJKlE+DQTevOnF4PZ3GfhTnAlGwexKG+6NmmQ4j1N4
	ylphMpwUDXJPMwh4E=
X-Received: by 2002:a05:7022:ea51:b0:144:c112:5f24 with SMTP id a92af1059eb24-1ac5b028d82mr27782443c88.25.1793898783373;
        Thu, 05 Nov 2026 09:13:03 -0800 (PST)
X-Received: by 2002:a05:7022:ea51:b0:144:c112:5f24 with SMTP id a92af1059eb24-1ac5b028d82mr27782388c88.25.1793898782603;
        Thu, 05 Nov 2026 09:13:02 -0800 (PST)
Received: from [192.168.11.102] ([124.123.80.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25100667esm9541181c88.19.2026.11.05.09.12.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 09:13:01 -0800 (PST)
Message-ID: <d9da4f14-4f13-4cec-b519-2c848894c35c@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 22:42:54 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath11k/ath12k: don't bit-reverse the
 firmware's PPE thresholds
To: christophergriffin05@gmail.com, Jeff Johnson <jjohnson@kernel.org>,
        John Crispin <john@phrozen.org>, Kalle Valo <kvalo@kernel.org>,
        Shashidhar Lakkavalli <slakkavalli@datto.com>,
        P Praneesh <quic_ppranees@quicinc.com>,
        Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Wen Gong <quic_wgong@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Baochen Qiang
 <baochen.qiang@oss.qualcomm.com>,
        Carl Huang <quic_cjhuang@quicinc.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
        Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
        ath12k@lists.infradead.org
References: <20261104-ath-ppe-thresholds-bit-order-v1-0-0f569106cbc4@gmail.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104-ath-ppe-thresholds-bit-order-v1-0-0f569106cbc4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Xd4cX455 c=1 sm=1 tr=0 ts=6aecb920 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=kllYWVK2JqQtNyhMtAlpJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=WwoKhXFDXbz0SCtfdboA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: et-lhl0WjYpE3aMM_eTF8x0RuLWGpt90
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2OCBTYWx0ZWRfXxE6N5Hv5Mg5A
 I/MUC+LE+B5ZB6I7DLe+Bf6fEXQizAXxd2VmfGkZ0eogHzEPRM9RSvPV90oIwYkAxYyimkJhGXb
 aMceUZq0Mc8EcYgIur07OJDPxyi/Xm8=
X-Proofpoint-GUID: et-lhl0WjYpE3aMM_eTF8x0RuLWGpt90
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2OCBTYWx0ZWRfX4zwA3ji4B19j
 mARNTF7A7ivekh4lshzosSYnjbz4rdx/qB2i6+hgEFi2VO5etbO1APzGdHK0iVsIL8/G094EUxW
 PWtPiSNbJkG75Qi13TwDIXZ7SPlBVaIcB42VKaQ8fRKcxn1gO352sgKrjfnzpQYVwWPjQAc7Z8U
 V80eiQtXJdJwnCbgYzD7wzmcP9Vv40RONh0rDN/+yL6IEHvn++JlhU6nhoJM/0INgxypEbdefqZ
 trnIeAc6mo3xXRElNwh0kft8XWEnlEUwd4PK3nYdJLLod4EdkR6r1t74+tb1wHJNCpKjXz5Qom5
 FVbU3H28CAJR0aRIzEvw9wqvR6UmtfnUGlLiMD5CvCgqOHqR6mnZpvJspz+HgzJFq19A9pYnFLL
 PKbB1nWE+wkAhcSQLT9CbDBolCeyIFUw32sVMJeMnP49ZdYJhCUA1NWkqAPhFKpLYTTu5osgM8s
 5H9LQjAbGI1ZOySP7qg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_171308_555667_D2018392 
X-CRM114-Status: GOOD (  11.15  )
X-Spam-Score: -0.9 (/)
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/5/2026 10:47 AM, Christopher Griffin via B4 Relay wrote:
> ath11k and ath12k build the PPE Thresholds field of their HE
> capabilities from the firmware's WMI layout with each 3-bit threshold
> bit-reversed (QPSK and 256-QAM swap places, 64-QAM becomes reserved),
> while a peer's thresholds are converted the right way. Firmware that
> reports 0 and 7 only, as IPQ8074 and QCN9074 do, hides it. One patch
> per driver.
> 
> ---
> Christopher Griffin (2):
>        wifi: ath11k: don't bit-reverse the firmware's PPE thresholds
>        wifi: ath12k: don't bit-reverse the firmware's PPE thresholds
> 
>   drivers/net/wireless/ath/ath11k/mac.c | 3 +--
>   drivers/net/wireless/ath/ath12k/mac.c | 3 +--
>   2 files changed, 2 insertions(+), 4 deletions(-)
> ---
> base-commit: a3ddbb45768717b5c9f923489387cf55c838d1ad
> change-id: 20261104-ath-ppe-thresholds-bit-order-436ac99c5745
Apart from Assisted-by Tag nits,

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>



