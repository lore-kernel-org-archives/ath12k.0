Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED73FD2CE17
	for <ath12k@archiver.kernel.org>; Wed, 10 Dec 2025 06:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HpIOlzclbpxai13t9ORLlrssJWTFgvNHo5cwX3WMPYY=; b=BHXzCwyg/Lp2SDXdGhgiS9bTHx
	pg0eSuogoFb/rxvRg26Sdcn4RhK6Lpz/mJ4OX7eeBk5lUGeHMg7Zhsmk0rcnWinSAxpD6i/9spDmN
	62osLAkymtWAzJYd6SmEgvnJQT4d3ofK7GLlozzYoG06mm5sCvMi7PATngVXuDD0zR/NPEbCoGWTS
	VCr95MWRgCOzTdhiAMRpOXfV0VcRznlBz3QAr7jaIj9ulCBs7TqBnWP0NaEXxX6FV7sLGwshTHDsj
	Fi5pFzq7A/6L6yqYEP2Hx7fJixumFA4zEV4UqamItjHT4wt9hRW9pN5lTySI5hBzwNnt5DgOFzBjN
	USNvdlxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTDQJ-0000000FA2A-1hXq;
	Wed, 10 Dec 2025 06:11:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTDQG-0000000FA1p-2B2M
	for ath12k@lists.infradead.org;
	Wed, 10 Dec 2025 06:11:37 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA4Xq861391141
	for <ath12k@lists.infradead.org>; Wed, 10 Dec 2025 06:11:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HpIOlzclbpxai13t9ORLlrssJWTFgvNHo5cwX3WMPYY=; b=jCzzrxqB6OdiXgy3
	P/uQwO6XLkXflU9svb8q4E+rO+M6PLOdu61tcrwN5QMDRTRsPhRDTZbayBzee5fp
	ZsNMQ3gNBYFyUeoGgcryYwIqK+cQ5febsdBhXOZxDG8OUCkOI2V5W8oY/DlRQnul
	o5+Pd6oRb2+kfRHpoOl1gBB7EbprNh4wY5rdu2TR7HHqlAZSSaiVSWb3ErPhDmH8
	KOu0RP8au9CnnbyqDIKwmABuiH6Mbajmz7mXdCqxwGt63UeRddtC/5zI0GlVgsxo
	XQ04V9fyya7uvZNuWr1tIyn2STaSF5O2M7lbU/wMcUh8U2EWkM2JbBXZluqC8NlH
	dAQiTQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay1xp07ff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 10 Dec 2025 06:11:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2f0be2cf0so2039189185a.0
        for <ath12k@lists.infradead.org>; Tue, 09 Dec 2025 22:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765347095; x=1765951895; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HpIOlzclbpxai13t9ORLlrssJWTFgvNHo5cwX3WMPYY=;
        b=YtB2qMPbucmcZrXxWLUQbM7kroDX/llzAYBFFGMHd9OjHNN+4JJK9Q4R+kGW59/Pqb
         uDYK4QH7b+RGtWIkrAkaStkKTiRIeARZJK/jfEnwhoFCHZbO/uLQFbCWMbAlFO+YFuSh
         7z1YoVLfLcG/feKcx3H2T6XHVZZ76ef9W37Xdf1Zj43GKGFSM5yoCQKnvTyYjSQd+ULT
         MsZfusiO/G0B6xBrD46l4ijTrGm6k03lg4yblMZZKyxDpAKi9BawcbPDeZvtzqq6n+oT
         kFCzlo8TdKxe6t+AGaG16xAVwWL21nHJ+O7N8cUJjhUXDxrDWVGh7OV04/P0S3Fz58Hx
         l+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765347095; x=1765951895;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HpIOlzclbpxai13t9ORLlrssJWTFgvNHo5cwX3WMPYY=;
        b=W3oeYTFNYjPLeHfuzGrf4o92/s+8UkGUPg0ZaBFT/KabyyZ3Cy10ZbGzgq5puOROQV
         ZOX6VdRXPHnJn29MDoK0+kvXwWSVb2JBBJguBXUSm0bOps26ALypOWVWUzqL7zv+vbVa
         fxFB9T2HeT0/Z7J+u1M1sPrrPMpOGyj4D/xAiImnrJLhrDnRyzwI4CGizzGIGF4m+3sn
         SEB13A/1VKQEs5QrlZ7pL5qkKSlGwPLeavZYC0lD6FwfFl48+R0dxBlR4VHl0QwPw7LU
         hzW+BGFFYqAYPhGIKfhMBliMVb0lnrubgTgECqY5kFNaIgPkxLFHmehLOrGhJvNw/fss
         fLZA==
X-Gm-Message-State: AOJu0YwvLcIsSmZfrEMfzN6UXkZT/+FGysnFgwPRfl0/igImWabrNr/V
	Iq1RxHLajuHbLaTpi/1KHHBDXDSx/H6/x6HiyrhpzMfFLoSCRG2T0UXu6TnJNlP27kgCxF3/c+X
	X6xL79Otyd1kbSPqQ3fSFQ6E/lTF0L+qQ3xIQU4wn1HD0eud4XTZvsYzsrTFbFp32
X-Gm-Gg: ASbGncvibEA0KRGr1zHxwRL7Z2Vz9WcVxtqe550aNkjLQ2GgL2LJjae/I+6qKFoT706
	uohk/EiUkcj4wLfGB6Z6sN22Z832lsSaAZ79SQNI0qdNhT4R+bQFVhnwRM/+seYFtZrGxiQm0Gy
	nyb5OWrF8wOB3iYzdj1fucqw6L8O1dO5sTx/x1MOKfONmQl8yaP5WQJ/8gilUPlBmZ4YrRWFWvd
	AHXC6YH99soZRgmqU++M30f067kBN1sNR/0CAuxyjpz8XTUyDWZpPuWIVy1pUD+Oa3G0QbBi7qq
	2fGrm7d13XozoOTaCuhbSjqnBgqdL+lygLrJVX7Gfvufwss66nYCIlihaYYnLY//n5FCjbjzlDC
	6xjOv0ZXVSANF6Br9i7vaQwDhAjPmEMQCMxD+gvhNpfer2CvBqRRd33qA+zSz+7eMrYKSTIZOvi
	0wbjAv
X-Received: by 2002:a05:620a:400d:b0:89f:19e:46fa with SMTP id af79cd13be357-8ba39a55f7dmr230104685a.20.1765347094747;
        Tue, 09 Dec 2025 22:11:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFvLE/DSkV07GsavgShrT8NHUQx9VGc5YPAPRfqtcW2l8ub7r6oUNEPdRTxYXByEJ44tuEYsA==
X-Received: by 2002:a05:620a:400d:b0:89f:19e:46fa with SMTP id af79cd13be357-8ba39a55f7dmr230103485a.20.1765347094361;
        Tue, 09 Dec 2025 22:11:34 -0800 (PST)
Received: from [192.168.1.188] (87-92-245-163.rev.dnainternet.fi. [87.92.245.163])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c1e405sm5862219e87.49.2025.12.09.22.11.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 22:11:33 -0800 (PST)
Message-ID: <799426c0-6865-41cc-ad2b-d832a1aad60d@oss.qualcomm.com>
Date: Wed, 10 Dec 2025 08:11:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Checkpatch warning of qcom ath12k wifi node
To: Yingying Tang <yingying.tang@oss.qualcomm.com>, apw@canonical.com,
        joe@perches.com, devicetree@vger.kernel.org, konradybcio@kernel.org,
        tingweiz@qti.qualcomm.com, yijiyang@qti.qualcomm.com
Cc: ath12k@lists.infradead.org, yintang@qti.qualcomm.com
References: <b1a9a391-1262-4eb0-987e-60bb34bdeb29@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <b1a9a391-1262-4eb0-987e-60bb34bdeb29@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA1MiBTYWx0ZWRfXx48c9/J+dhY3
 r3Ah9844XqjGflpcznPxfcBVt6ln2g0Or5b2riiGDiOUn0b05RGw3X49sDaD5GuR/3BUMZPH0Ew
 iW3QKM1Ix2VCp9Mnm9U/tmjd8ojJVeAP2K8yWDEY3YSvkPTfcMAsPSPdSgQsqSqkcvtsjFfB8Yl
 UEm3aN/8G8bKGfwQ4AC/XfMJnGJJ8+Tzb059ZGRGk9USu+taAkblc9iN23sR3sOS3s9S9avb0vf
 0MbNF90UqLVVDbDEwsCErb+SDs2oSLOCPXSvqf3rJ8Ze1g8roMcs9PpPy6spxttVdpUzTg8+51A
 Q9RYHFQCL2aHVOU8WhDO06ZnUl4swJHr4osFPfkTTx+UVPCBwTgZHbBjSwLi/ouV38VJ9vRkivT
 EZ6sYZJtOLwLq9QfG9x/8eawkfZsfQ==
X-Proofpoint-ORIG-GUID: 7wFI2QcNpAkKowosR2qXcYdkPCrODRNz
X-Proofpoint-GUID: 7wFI2QcNpAkKowosR2qXcYdkPCrODRNz
X-Authority-Analysis: v=2.4 cv=A/Zh/qWG c=1 sm=1 tr=0 ts=69390f17 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=+WgfKLcscl3VAWRHYO56eA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=0-fyCwABM2FTKplKXIsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_221136_586017_FBC8C343 
X-CRM114-Status: GOOD (  15.66  )
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



On 10/12/2025 05:51, Yingying Tang wrote:
> ./scripts/checkpatch.pl arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> WARNING: DT compatible string vendor "pci17cb" appears un-documented -- 
> check ./Documentation/devicetree/bindings/vendor-prefixes.yaml#1026: 
> FILE: arch/arm64/boot/dts/qcom/sm8750-mtp.dts:1026:
> +               compatible = "pci17cb,1107";

> 
> total: 0 errors, 1 warnings, 1275 lines checked
> 
> NOTE: For some of the reported defects, checkpatch may be able to
>        mechanically convert to the typical style using --fix or --fix- 
> inplace.
> 
> arch/arm64/boot/dts/qcom/sm8750-mtp.dts has style problems, please review.
> 
> NOTE: If any of the errors are false positives, please report
>        them to the maintainer, see CHECKPATCH in MAINTAINERS.
> 
> 
> All dts files which contain (compatible = "pci17cb,1107"; ) met this 
> warning. But in fact this DT compatible string is already defined in 
> devicetree/bindings/net/wireless/qcom,ath12k.yaml

Have you read the message carefully? It thinks that "pci17cb" "vendor" 
string is not documented, but it is not a real "vendor" string.

> 
> I raised a new change review https://lore.kernel.org/ 
> all/20251210032817.1264850-1-yingying.tang@oss.qualcomm.com, it also met 
> this issue.
> 
> 
> Could please help to resolve this issue, thanks very much

Please send a patch, making checkpatch.pl stop from threating pciNNNN as 
a vendor prefix.

-- 
With best wishes
Dmitry


