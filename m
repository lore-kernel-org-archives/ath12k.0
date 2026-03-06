Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC48FCB618
	for <ath12k@archiver.kernel.org>; Fri,  6 Mar 2026 15:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0/756cthtUIgOJKo1UJZNjKGTLA8f8YYmW1bpSBDIWY=; b=S229/9mgFNM6yaNLoi71RFavI/
	SjAnQ1+4TUxmzrs51PE91jPeVV3wih5Lxwwa0Y9APirj79nDTYkf5xsYcWHuAQIh5uNT3n59+Lxvx
	ctRiLGO/8N0iMNKl/XV+rGrFL70fRVAnNampf1PCi6AdBn7D5hJDbxVjVpofz2MBtSO0Tjtbq9OnU
	SbH4g4YgbWEWQb4Ye+KUvVr22FN1HFeUC2iCH/4ILEgoozPu2rNR95NtFXEFKBX16ClQOgdYfCs70
	WFHaKwd0T7xXIHePnjArV9a+3bhICafP1EUjLR/XPw232WwVJ93WzOvyiLbG4F5DTWFZhP9f9Kocm
	myhyvfNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyXQQ-000000045Cg-2yt2;
	Fri, 06 Mar 2026 15:49:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyXQN-000000045BX-42cm
	for ath12k@lists.infradead.org;
	Fri, 06 Mar 2026 15:49:13 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626FT6C62522589
	for <ath12k@lists.infradead.org>; Fri, 6 Mar 2026 15:49:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0/756cthtUIgOJKo1UJZNjKGTLA8f8YYmW1bpSBDIWY=; b=cEnu/OnAC1cBRLNl
	4oQ9YSwsZrvBAX9vdKjIs9IzdOxhYHFFQ0EAkTpagLjsb1DfxR5yMosUQ3mz5pDo
	S0lStsQEKOV0jFVu6gcYfnTboyaow+s2cJOaGYaQfpvaYF+RmDLZPh/Ec3Q4HHzL
	Z4ms2RHS4O9mHg1ZDJsSdiKGKAVEjPMiGp0rVjpjmHAvTmzI7XmKLHrZcEGy0R4O
	1Pn0H6H086qujpi/XmdmZdKzDTWEaQZJn0ctv0+8fOqWxpWuTHXaPT4sSIpbZi5c
	jEt096fLWsPp3uPV3vFuKCWSlMp0pyiUXcI3mQVepsO1b163WXom9joVA8/cXTl/
	cA1vHw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqfg6brsv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 06 Mar 2026 15:49:11 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1275c6fc58aso17579822c88.0
        for <ath12k@lists.infradead.org>; Fri, 06 Mar 2026 07:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772812151; x=1773416951; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0/756cthtUIgOJKo1UJZNjKGTLA8f8YYmW1bpSBDIWY=;
        b=V/gEblvr2tEu7ssKgWch58AOuwrGBxCPR3axM8ue6R84uJkT+ObQ8pHM93Cr0mpzAY
         utC44nW7il1WqdNyJ3T/03fUa/R7Sxzvo/EeOR/YZH2cAch0Mqp/Ns07ntKPQOn1MO7d
         5kuBZf6Wd1OFbvjaE2lxVambJAJKo+MicX8q7XlRdY9moVehjVZ0wCjh8D9ttcDj/H9k
         DkNnjPvxlGZF/dW2YvptfoC0RnOrowxY3Miz7gF532f4zsKEZmkD+93mEyujZ7VgbSzz
         YKnewqfNOI9A9TunwVav0da+6vq+14xbz3Nf5C8khaEQpPNK+aSITy7bKRRmQB9ysjXl
         Nl+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772812151; x=1773416951;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0/756cthtUIgOJKo1UJZNjKGTLA8f8YYmW1bpSBDIWY=;
        b=EaTnvD7uUXF1oKUBxgYIuAVeX5Sok3n6nUkPgd5ZZzKOK+X8LJv9Tbi1Kqi53b8b0n
         gq5mmddg8RWcTVFej7TUFnuOfFcMkZbnfKgsm+08zAfXVOwZRFzzvQCaeTQKC+6G45Yk
         gQ0VkXTxQQnw4/GPGPNjNgH+YBveRVe8NTIwFhYF8oXFl05XNJUjSjEnSJJNnNzj04n+
         LydHWtNWChlVZD60CvZrrCXIJn1mvg53SinLxLhFSEQP2Kwx0vObrWW1Kfut1Yn7g4Jm
         2ORyRiLpnagzLyYxI8fL/FTnXH27YYy1hRfHiP63D+WWlVX/NheWaOyGakSLrW2kE+cU
         /PVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFpmDp7ZA/Soubz0AUtD61RLz3T+2ixXTkZBtcg2YzqOVpzGWebtB/MrCWKImtIp43SxKHRWc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxjGukWSEIZuNfhWrKHATwrpJW9D6/0XoOmfAeOT7ctguOhuLEd
	nRE2+LqBlSNJk5r1q6jaOltUqo88kMVXwzfP6595QTdBXw3u4JYbzpOnMDxsWh12sV6yx4cquwI
	ZYnoSRFVQjb3IY6u+fclNm68WkvAc6QWznkgz4QPQizlRq07XSg5GsrwMARB5c9vX
X-Gm-Gg: ATEYQzy1l4lBGL12Lxuy5Dwvo1+Gwd1P/a72GZ03WK55YvyGWFqp4l+VCuYI1SGMeeE
	YWjc+qpYkti5echaWSlYStDFBLIyA+K8Fz9fifTJxipaibX+vqlHVIAHJzpMfnPQTWHeuOD7DaR
	xz3iwxVEO2kAgxJUoFtKkkpVu4s71OZqPb23xOkRFZcI0xydY6Stl78AGYEccAYclUfTMVLfJRk
	U6ALjOa/h098erRUhrdwkElebWAOQnNeZvnBFWaR4fZsEZ8/3BTD4sd4lT+t2hHAbLUdThrKEMi
	wQb9UGgZyvTUvm9mO6Qj1oxx/6DuhbHTUtvUY3qb2C5ljb7gMN+Hvlfh4SXFetI+5v41hlOOTLX
	77KeJf55SfUSTAiPwm7kCs5H+3RyrCoVtPlzCsA2Dr2lOBX9WkSw5TQTXzzRNYNPkZ35lb1VhUp
	ycA4EU9xg5JqyQ7g==
X-Received: by 2002:a05:7022:6898:b0:11b:e21e:5653 with SMTP id a92af1059eb24-128c2e0c967mr1056249c88.19.1772812150814;
        Fri, 06 Mar 2026 07:49:10 -0800 (PST)
X-Received: by 2002:a05:7022:6898:b0:11b:e21e:5653 with SMTP id a92af1059eb24-128c2e0c967mr1056220c88.19.1772812150163;
        Fri, 06 Mar 2026 07:49:10 -0800 (PST)
Received: from [192.168.1.41] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128c3f58d24sm1497977c88.12.2026.03.06.07.49.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 07:49:09 -0800 (PST)
Message-ID: <00a7e65d-aad3-4029-af51-ff0870e65595@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 07:49:07 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/14] firmware: qcom: Add a generic PAS service
To: Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        sean@poorly.run, akhilpo@oss.qualcomm.com, lumag@kernel.org,
        abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com,
        mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260306105027.290375-1-sumit.garg@kernel.org>
 <20260306105027.290375-3-sumit.garg@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260306105027.290375-3-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4XiKDcOqjp9Ck9mzuKxTJeU9TXYUNYHA
X-Proofpoint-ORIG-GUID: 4XiKDcOqjp9Ck9mzuKxTJeU9TXYUNYHA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE0NiBTYWx0ZWRfX4dCTjHvBVBwf
 cJtRC3DnPnSDNUmb/6AsAmX2ByGxv1QreePA4fM7chI5cY3MXlA64DyqrtvRsT4IrG2cxRmkbxG
 ztSHWPwt5UV2B7VKuE9Av3L+q0Ba3k3JD0jiOXcYXeoKwX/l+uKjlco2ovm/owkCYD3Lhu5M+q1
 uMloMBmO80DNgdttgenmsWsKaR9lbpElhBJRhExb+k4gtwCj6ibhAT10BSf795dI2h35OOfcbxi
 aApPyvGAFfkx1B4i2MHjSXPdZQ9DMFe4Piq9X/erG73WcrN+yKj8sT4bfqU/yNRZQJEHdceyHcx
 KoSu40IFaWcPw1b7C3U7ftT+7/SHhp5W0sFOhSIptT1V8pCYvx/8bWH07/hEkvIp2icKh5OQzIM
 518+nwuPLtWBGNktyBEdMKKo8uT5GSBxN05VMbiNXKfZBC4pnXFJo/jChnKa9CPh28c7lts2Vwd
 4gasAOIbyARf1jh8VxQ==
X-Authority-Analysis: v=2.4 cv=XKg9iAhE c=1 sm=1 tr=0 ts=69aaf777 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=PJDN-9afRshu8rMoDvAA:9 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_074912_011575_B4A18690 
X-CRM114-Status: UNSURE (   8.63  )
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

On 3/6/2026 2:50 AM, Sumit Garg wrote:

I missed one k-doc warning...

> +/**
> + * qcom_scm_pas_auth_and_reset() - Authenticate the given peripheral firmware

s/scm_//

Warning: drivers/firmware/qcom/qcom_pas.c:173 expecting prototype for
qcom_scm_pas_auth_and_reset(). Prototype was for qcom_pas_auth_and_reset() instead

> + *				   and reset the remote processor
> + * @pas_id:	peripheral authentication service id
> + *
> + * Return 0 on success.
> + */
> +int qcom_pas_auth_and_reset(u32 pas_id)
> +{
> +	if (ops_ptr)
> +		return ops_ptr->auth_and_reset(ops_ptr->dev, pas_id);
> +
> +	return -ENODEV;
> +}

