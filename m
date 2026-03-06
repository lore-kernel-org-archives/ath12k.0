Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A30F33A92
	for <ath12k@archiver.kernel.org>; Fri,  6 Mar 2026 22:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gYR9JUD/FzJUCFovVZEtzoQZJUM7b6CyT+PGPqzVdqg=; b=zlC27nqUxa6bajB5n+Y+93dYO7
	57VFClh44IFyafdH63PlJ8fWH9ap2JDYSa1r1Xy2K8akSO2G0ZNCKwIJ98G5WOALzCP6hPojCSXsT
	mzxg8zQYEwejr7WIqRb97Ol7j0sLSVDe4bmU94oAa6r06/iaBeMZbJarfA9E4BG2zT4VhtkN44zTe
	bTXnwajm14HBwTPon7gaeIeehSznXdw2HQcjsVpT3oNwFUt+io/jvgvXc73SLPs+2+Q4elQFp2az8
	6aU0KiXOhXG9zxSSBVOLlkoOrGXuOnsk90qXQHbzKNxf06wIYKe12G79Q9P8icZI4ubNeJMP7lNsF
	8o9zzEqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vydEB-00000004YtH-3sA4;
	Fri, 06 Mar 2026 22:00:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vydE9-00000004Ysx-1bcW
	for ath12k@lists.infradead.org;
	Fri, 06 Mar 2026 22:00:58 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626KWc6t692885
	for <ath12k@lists.infradead.org>; Fri, 6 Mar 2026 22:00:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gYR9JUD/FzJUCFovVZEtzoQZJUM7b6CyT+PGPqzVdqg=; b=LZFxCCUn6WpNEccg
	RJnzb64jVXdN3+LfB8r8zhZFKZvCxW7dwcQdYCpWhoWQ5zLxLUR1MJomYdDYFV7g
	52tgon9P+7hTkEdj68q9W2y7TrE9cQcZblIsqWVLvUR4AykkuAbEZdh0MT9gpOUz
	yn6Ebl0mn+fs0Z6dg+vdt16RUdTBDUpiWWvlf7fRoTPE4pboJgPsI061h4SS/io3
	Tp1FjnM5LfCpfd+0/fC/vvDevcujlhfid2NYFvI4lIa8Tutb81vWpz2IIkl66HLU
	0uPflehAB6a3WuWNrav5pU+XcrN8ONqkeOcPSYbv0jhXD6lYPAb8BSyHjYt1piO9
	kJQLhg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr5rd098k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 06 Mar 2026 22:00:56 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so8701524eec.1
        for <ath12k@lists.infradead.org>; Fri, 06 Mar 2026 14:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772834455; x=1773439255; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gYR9JUD/FzJUCFovVZEtzoQZJUM7b6CyT+PGPqzVdqg=;
        b=TuMRuqrPbX2/3kOpNmvAxpaU6dZ7gz6uuc9+jrfsPm3QW1q3nvlLlZ3pQ3t+VzqUCQ
         ICu58XRQwtFMWKnopHyrkoCswTMYSGjeKKiBs14KYIndr3jGH9xKFsSlYCWRpLVodpAW
         upNw7kh/QWQlqzrZ3XcnPBPVXlEt+Rp7JXf8+1Tb+FAjhAlofMA007ydj3z6Ggp1jSh4
         ayUvuZ+RdNDQx7SVSy5236R2cpz6ANdp8CAVPzqSptP8F189VuzhFY8Lgj0V9S/d78Zy
         c63bc6QVD+qSHgikHu2/dKLWzZzhLuAbvz+HsvCCAjBMtBcr4EZ5iHRXc3Y3dgp9LFvG
         rxKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772834455; x=1773439255;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gYR9JUD/FzJUCFovVZEtzoQZJUM7b6CyT+PGPqzVdqg=;
        b=BGaIhUFow7C/r4cb4XTAsqT0aLt01HTpY/1z0HRrkBimlceGctxwl/j7raJJarQAtF
         pEDd/uGxlF9gexmdmPvxEvanLmkZW/99NCUT2AvtLwhmWWGUk1yFhiFjXtWFExjZDIOn
         XHSCYy6jXf9NXVy/8ypuSF4/uL0jr5mmJaha2Vjg3uQ1PaxcCb2TdrTast8A37TvWTHe
         362EAB4+4t3IwlaZbthwjuSZSajTMid+2jMK0joZ/TJBmCsKHwxzUUjxUvgZ+rp2XvVs
         8hEpN5djN+PusbfcNTCq/vAL90GDv8jlrZTerYT5wy0gbek6lOpzY0yTVQbFlxttUu+W
         RMGw==
X-Forwarded-Encrypted: i=1; AJvYcCVYEJma5ia1uZT33wXdKdole2wHz2zk6b0/R2opKLTKmo+0XPmlIhRAgX1veiZ/g+G19Ky44b4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzkjZyCyrMNgF1Z9WQ+1mq9sPIACCHFYFgRDpKm4Ar0s3Wv3uEr
	eOgF6W4oyYvh5OiSOv0gb3I69zMDb/yZpXGCpItr+QggC5lcS2YGgvVKBzcS0gX85wRMRp0xOv+
	XEnNv/Q/wt211Ta5ijDR89XUinmZrKqpabIYMpMmA873Aol6lfw5RuWwu5ajo/tMq
X-Gm-Gg: ATEYQzwnk/TwOtssWDQBFgMbTcAHLMdPoDc3EA1drqz4Rugju1MimqAon2Jvxf2Gkh2
	3iF+bN+GcavjWvfuVlsc4Y+PDkAB+oEYj85aBMSiZueLLEK/T38LCs2wKt4gx4P2io97T3Cie1w
	+diyyXdKP8Ryu+9o4Q78cVYNLkPWN5mzMWn6Gfse69D6rFYCZSkor5OsKlRZKdVgPOMtl9KlCDp
	7wZEcWQSqzw+aSp/xRAxjB+mFWb7AiQ2fzrMDRElUBEwqN/RoeB0ud4GRmvrk/UyFNgm1ByPeKl
	8bp6pwDoirkwUgXeTpUcqCNEseSCo97RJjKFKPrwo0kUH8cTF8nPawcH+cxVTn5YkU1zejm7xJe
	4ZqjNrNcgyFMOoFdnDd3N9tVe21ee2qU5u3q1MgCyqBCdhaJbLrrUGP+BXJxA4MYiQt9Vl9kjlr
	O06K8fieN5s+foIw==
X-Received: by 2002:a05:7301:608a:b0:2be:1946:8587 with SMTP id 5a478bee46e88-2be4de8f969mr1272731eec.9.1772834454916;
        Fri, 06 Mar 2026 14:00:54 -0800 (PST)
X-Received: by 2002:a05:7301:608a:b0:2be:1946:8587 with SMTP id 5a478bee46e88-2be4de8f969mr1272665eec.9.1772834452873;
        Fri, 06 Mar 2026 14:00:52 -0800 (PST)
Received: from [192.168.1.41] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f80cc1dsm1962924eec.3.2026.03.06.14.00.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 14:00:52 -0800 (PST)
Message-ID: <13091f47-938d-43fb-a8c0-4b081818b557@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 14:00:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/14] firmware: qcom: Add a generic PAS service
To: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
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
        mathieu.poirier@linaro.org, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
        tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260306105027.290375-1-sumit.garg@kernel.org>
 <20260306105027.290375-3-sumit.garg@kernel.org>
 <e0a86461-c136-4371-99cf-c0b0d31443a3@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <e0a86461-c136-4371-99cf-c0b0d31443a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7lsj8aAT0qTTEM-KJJIvQ1VTfnqVsfiL
X-Proofpoint-ORIG-GUID: 7lsj8aAT0qTTEM-KJJIvQ1VTfnqVsfiL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDIwOCBTYWx0ZWRfX1z+mI3PlKO/l
 LDaqSshiv5atcnxa/h62sMtM+c/nPCfWgcnuywC7Fwpbv66VS21zh6/Hmwrx2nRUBYdwzrbNgS0
 3qOBzhMzSx3A4/pvIm3xDO1NhJBHdTFlKcI2VF0c8bz3e+ycZz+v7u11YzhvvZ7gXVcyLlbL426
 7S1vv9g7ovYY/BqcZsqGfxxlEOxesx8EsVMLCVxIveBQV+TDiY5vAszwwcQ2sX6M8kZ/eqt7Ixg
 45ifez9TKJt0zYAEWPEimhIXFD4erMd1MsdIIuDSYCEaPRdwnYWYGzYxIZE7VwRJTmJ9vgipyOZ
 lstkLopm/zdo8t15rd1VqAtVYXr9PygNnqI9VbCUhm9mFbm2YfKnbqLIXoRySLz4hRvz5bVoCbf
 YIzVKYLIDbRZNeDgXmutJpQYDPlb5iu8KsMryTAG1k/SbAIu2nMPtLaI4SEVy0xl0YESLsWLHrI
 mesNIJjvsn/Q5fD1pCg==
X-Authority-Analysis: v=2.4 cv=P6U3RyAu c=1 sm=1 tr=0 ts=69ab4e98 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=JJlnT80H4U8AMWgPcGUA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_06,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 bulkscore=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_140057_569621_4F292F71 
X-CRM114-Status: UNSURE (   9.43  )
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

On 3/6/2026 11:47 AM, Trilok Soni wrote:
> On 3/6/2026 2:50 AM, Sumit Garg wrote:
>> +MODULE_LICENSE("GPL");
>> +MODULE_AUTHOR("Sumit Garg <sumit.garg@oss.qualcomm.com>");
> 
> What is the convention for Qualcomm authored drivers? In some drivers
> I find that Qualcomm doesn't add MODULE_AUTHOR. Can Qualcomm community
> clarify it here. I prefer consistency here for the Qualcomm submissions. 

WLAN team was told to not have MODULE_AUTHOR(), so ath10k was the last WLAN
driver that had a MODULE_AUTHOR() -- ath11k and ath12k do not have one.

And in reality it is very rare for a given module, over time, to only have a
single author. The git history contains the real authorship. So just for that
reason I'd drop it.

/jeff

