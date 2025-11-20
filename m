Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67134CF9C7B
	for <ath12k@archiver.kernel.org>; Thu, 20 Nov 2025 18:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JuyQcpZNlll2DkMsFvTsaPoccVC77T3rZPbIJMTs2D4=; b=0+m3ZqD0b7M8m7ysJm7rQk1eX+
	2cHYaHoIAK6mZSTYachuXOMXjjSrsHxGOlIAXyhKO3Th83G6gCIAwdWVQhEPKCwYkwA5tAf4OEQDH
	GWv6vFDXxlCJATGZAe1xiVIGUpjW32oaoCds5ZktRsYhg7O+qenEVxQU3niEGlv3QIPKxQZQ7CW8z
	Eg3cAbZomJouSSzKreX7uD/7YtOpYRJig6Wk3eh9Pthw2Crk0DxMCY1W3oo8bYNbJcdChoNQg8bt0
	7WRT3eb6Pb/dP7OvGgq2WgDhogf7U5BwuO36fw9u5uTFQUG1CtSS8g/jyGHBiQcFd9eSWXOCi5bvZ
	woRxlOGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM91q-00000007CPk-46yL;
	Thu, 20 Nov 2025 18:05:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM91o-00000007CPP-38bj
	for ath12k@lists.infradead.org;
	Thu, 20 Nov 2025 18:05:10 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AKFnKhJ776206
	for <ath12k@lists.infradead.org>; Thu, 20 Nov 2025 18:05:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JuyQcpZNlll2DkMsFvTsaPoccVC77T3rZPbIJMTs2D4=; b=iDuwMoq60s6wYUco
	8onsgt1l+VyGDcvr2kc5WJUpFbJaZlpkXaOajVcYXr2wkfcduYf4VMTdNBMvFMcv
	RsBlnNWdAzN2UEalw76NfUebuJUtY69dNZwWC8fhcVR1x7z9SETZRkfwecKIxWzz
	9P71m7KY8Bqv+QLpyfM7gyfst17O+OIM+w8TYLmER3srbiJK/RgGv3HGNvixr6YE
	9DJJB6wxygTYxzhNecdGPN9FvyloUFLu257zi9o+FtOqCLzRD0ewPpO6pM5mteNO
	loTp5zBAqMGyiIVHIVV44/L3fyQeLYhskeP5skrbK69tc5OkJwL0w8S8Fse93BlC
	mlu0Vg==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aj5y7rfem-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 20 Nov 2025 18:05:08 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-3d41cd7329fso1629057fac.2
        for <ath12k@lists.infradead.org>; Thu, 20 Nov 2025 10:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763661907; x=1764266707; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JuyQcpZNlll2DkMsFvTsaPoccVC77T3rZPbIJMTs2D4=;
        b=VgbCUfbvdSGu2GCSuCB/65mRQbQlYze/1ZFOfScL+JREqMiYuWEu3Z45+Fu0+mL0SD
         RWx0H1+IZniTIcMS+JlhFXVjn79VYrXpQh/uSMds8+PfcER2R0XtNlOtZlDW0Loneejx
         cKOIN7JaAD22VVcOasbxP03UgaGUbDSulQoAyE3DR1t4K2K36FXAVwHzyEaT7GDG5d1l
         +HmGoVLa9qegShnoVIyUSh25IugcPMQOGXNXBAPBgoQ61t70ksU5IWSZoBZIMkpwha/U
         SHq29Ub99qnOHMwP/6sh5l9k3mddTQBt+7Jw18fyukLX/Wl2jMY8tgrIqVE/LCx9UDDn
         R/UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763661907; x=1764266707;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JuyQcpZNlll2DkMsFvTsaPoccVC77T3rZPbIJMTs2D4=;
        b=WOmTP5KR85QRrVyGAPJ8u5ddPGBKBGAhBHateATJYK7GR1hAJAWy18KqJtEX6M9wjq
         v591IwuxSwEciTnLyttJCpSyJoC3nPKhPxJ4up4uyya1rKftwKOnis2zm74mNUq26W/5
         qWP4wkr3ngJivOkCSivTGWTsjXKpfgwgZJ87y9WahQUT0wwIZjDB+GF3liwOq04e78fh
         ZoQL+ExfL2p3fCVHax879iJmM/5sS0NRRsOJMk7JWdKywz/b/BXc3iumvz7n6hLEUtVr
         Ud6XFyA4ht/T3bVRV7RuxcrDzpF4zRlruF7mODwefT6n5MaAu67T3PfsfuhKrXJSd9Fb
         iIbg==
X-Forwarded-Encrypted: i=1; AJvYcCXhM33LVXA6FyNdZjSrfDt/7YKfi0EezxoFZDdY2yrf5q/euxi6i0nDTO1tNOI+LlsMspyvTgo=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywa+h3ziuR4At+G26U2JKllZth38os2UmGDn3jf2cq22M0WpCu4
	3yNdRBQPsPECmgIeM+HRqogrqYMFSPq7YTJt59dsSfgLLaNR9aG0wRNuKODdEUIVaW43ZwSZS2o
	hc2+uzCESE+rPSMlvd0pZQdPESiIpUIDil+DmQSjI6oQ69TgJZMYVR2aHM9xPI7NN
X-Gm-Gg: ASbGnctYB4LmyNwpusH8vC8FFyfNb1+xtXrEPKv2xVP4M8qgSTr4mzcLFGPsUAqsZNa
	5wNBCCa8clDDTYqaOybsH5aa3rySRQ/uRHZ2fDkxfuDcOcxLG7Gmr90YUflpMjL3ZVDcDzEEfIr
	jCR4B/IHYdpXfcQsofAOS6sGLYpTDcmzHwaUkT4aeOQuYBePWSsm4SxC0HnfmdWnNHoJnXDQpju
	l7V6pNF1k4y6N+uAgYS4fcnOGML1yXZJ2s0ijmcf4dbR4Pl5BJ0ck7h3RBqzTfnv2sqE1WL0IqB
	nFhO6na/CvMn9dSyFulBl0ZdSW8WYwerheu5NYZjpPf5QopvyrL14Ghl0Na13EyOxc+hD5VBbnJ
	VNdcVKSYh/CmLaL2Ff4c/hIhovSvTsDTpLdV30kjNzt/Fwd42bj4kd6m8lo1LqWks8aMUdfFE2g
	rO
X-Received: by 2002:a05:6870:8904:b0:3ec:5ca9:d15d with SMTP id 586e51a60fabf-3ecb81acbebmr179316fac.37.1763661907285;
        Thu, 20 Nov 2025 10:05:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEd5oYmMj/INKleQZdyU+i6Z44oEC8iroO08qkoEl/5zRQjjmiIxz5eeEhp1rBkuV3BWRZMQ==
X-Received: by 2002:a05:6870:8904:b0:3ec:5ca9:d15d with SMTP id 586e51a60fabf-3ecb81acbebmr179281fac.37.1763661906834;
        Thu, 20 Nov 2025 10:05:06 -0800 (PST)
Received: from [192.168.1.3] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ec9c2cf16asm1489091fac.5.2025.11.20.10.05.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 10:05:06 -0800 (PST)
Message-ID: <69b2d01e-38f3-4a6a-a7e6-5d94d42fe65a@oss.qualcomm.com>
Date: Thu, 20 Nov 2025 10:05:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] wireless-2025-11-20
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
References: <20251120085433.8601-3-johannes@sipsolutions.net>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251120085433.8601-3-johannes@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QMxlhwLL c=1 sm=1 tr=0 ts=691f5854 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=3vU-vsCiunfMoQw1-XoA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-GUID: dUY5BtvGhj-d-QD6J5iDpMcaKXRg84ud
X-Proofpoint-ORIG-GUID: dUY5BtvGhj-d-QD6J5iDpMcaKXRg84ud
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDEyMyBTYWx0ZWRfXwflxiW3Rxuzh
 ablrrgItZzh/HLeHYSSUFM1rdvMKwTQkpl+58AXTZZ42n08s4N2/jFgGBRH2bFRl2NA4zK9hULG
 5eKhVweHlVqj5ZkJ9r3CK6yhyEikj9pwkTriAbhMNpn/y5uP0CfLPIr1SeZcw10hEz+XESkLroE
 0IUqfE6aa+CE5D7UNY4ucIRkNAjFBgy2dIc1aTLlpJIpdk5355ZuYZgis93fk7w3WN2SPEk6P7A
 /r7iOAr7vZwdcweUggVYPeYa5j1e+xhfyvZuNNG/+Zmv1yF5CmPG+89E8eLh3vL0y5FLMlXOpz8
 HBIwGTemg6fHmPioZGHYE55sQEj/OUyTkz6MO2t2WtkLMXwjLEbXZlwF5CVEsEAXnqQGtiUt++h
 8FEJr99dcNwnoUqI/5/kko4P6gZp7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_06,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015 spamscore=0
 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511200123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_100508_832716_EAC1AEE0 
X-CRM114-Status: UNSURE (   9.21  )
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

On 11/20/2025 12:53 AM, Johannes Berg wrote:
> Hi,
> 
> Looks like things are quieting down, I fear maybe _too_ quiet
> since we only have a single fix for rtw89 scanning.

Isn't that the way it is supposed to be heading into -rc7?
:)

BTW internally we're finalizing the ath12k-ng => ath-next merge.
It's a non-trivial merge of around 100 patches on top of around 60 patches
since the branch point.

Current goal is get it to you next week for the v6.19 merge window.

/jeff

