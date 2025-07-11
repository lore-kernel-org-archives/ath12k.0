Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37914C8303C
	for <ath12k@archiver.kernel.org>; Fri, 11 Jul 2025 05:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gkO0GYxkKlN95Jpg6S9fPel3lmdgttIodj03QRGIjyg=; b=eCCUvPEx+mnAY3ab8BD4jyDC0r
	vzg2JHkSg5NpyLBaIsmwuqGZAD0iDG8pvtj9RtnAGA85QMFQz6gqI+wpAkyuCbMcOmTNvq5OYnPJc
	bKSCk4q8lb694I4XblSilKD0z7W0w9sbRWY8oN5OJVZJeoSR+NJsuP5e9plqzkWCVKIDroEyUt7c8
	CpFxgPpbAsyzTUi/diUWjJe/UTWxR6ggNzjwke8oLLjSSfdYWUlnzfuoT+gk4jyPpFNjA4FNo8rH4
	I+QBvL101+VPpHWYxh8/vh8GqlKrnAFfsWLYgmbJ4yFb8c0oAxF2zyse/Y4uoSFqXbyw7KBn2IVfL
	y2LIXQqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua6S5-0000000Dlaf-49Ft;
	Fri, 11 Jul 2025 05:37:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua6Ic-0000000Dki7-1zD7
	for ath12k@lists.infradead.org;
	Fri, 11 Jul 2025 05:27:55 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B1XLB7003320
	for <ath12k@lists.infradead.org>; Fri, 11 Jul 2025 05:27:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gkO0GYxkKlN95Jpg6S9fPel3lmdgttIodj03QRGIjyg=; b=HjNQfKPyTyP7eWqv
	2JW8tVJpaiyLS5lb5NXYMc+rQ7r8QWwe4naJjsOjdS566WjiS0Y2klZlQ+lqQ1u3
	J0N5bN5fKBX8Tm6G6ZM5q1u7ad+ryCRV51KfMYwCpQHxZCiHEcDH5V+H4bCJGR14
	G1RQgGwtRfIuxItob91WQQn5BQK8022I8f4mfM2BAKPGTiLyCOgoYFOyh/Z178Fu
	6hdFj9WMMq0G5Ny9GK0JzCCKw4nKRmooTC4GMr3aIW1r/E7NReUIWtFOWQipObdw
	eHGizk1c8gFxyEpUla3omtBbuYnSZPxuk9FJESqdMXa23Kb2trOri0WEjOIrNQY2
	n/o1eg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2bjk3e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 11 Jul 2025 05:27:53 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b2fa1a84566so1406014a12.1
        for <ath12k@lists.infradead.org>; Thu, 10 Jul 2025 22:27:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752211672; x=1752816472;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gkO0GYxkKlN95Jpg6S9fPel3lmdgttIodj03QRGIjyg=;
        b=bfR96OwNRT0uYkvCqqTJsYGqAAf3v0zrEln56Ljf8qbWuyQ4n6QRQbtLo1l4L51/+c
         j+eD/umHgcs4kh1ZFJwb1RA8eSV0UZivSf0owppSD7GBwXQ/ECfXEtKYiEYlGEGbw7jG
         KgRHQaE6F4/YwFGwW/POAelYes3UCjl5cEq7IaxP/PNNf7i9zD8+n5Hr3iRrXHLtddCy
         nI3GAcNXCLlzDIcvk8oazQ/a66Uy4mlHhMr2urnutWgIxYnrZ9W5h+OuXk+p1P5jiZqA
         BWk0vz7hg73q8msJlgmx3gaC6ImCXGpiOiGGVI+pWhUcgvdvDzaDMnrPXj4ld2P9MwwK
         +m3A==
X-Forwarded-Encrypted: i=1; AJvYcCVU1tPEYSdGWnSg18IX8VNfP9yQY515Y67RUcdfv4zwLDDAPX8NWOJzykh+Gjz+vagaJDkqxGM=@lists.infradead.org
X-Gm-Message-State: AOJu0YyQBl1OLOZTWZ913DS7o9y1oj7vVYztfimGxxG/MHg5c4JFciHa
	gc/c0/IhC2jxuxxp1VNAXcBRW9EBCKYiElmgqB3OKJKkshgPRdLLv3jWClxvZXzNyQ4kN4xklO7
	BphQIghi28fsPIVJsb1ltmhxk8eSzry7VtlCSm670e1Np4N3q/qIVxH9ng5d0kg28
X-Gm-Gg: ASbGncvo5dFyWUiFwkp3YE2dOxiWGw5dHcilUFTng8vvS+uGs2lDTGlxnwPXY6XwUE+
	6X7NJMR5riPNg/+F/YmLKxlOMZGbFKlR0on5y/NG6sn1ftOXYCfHposuz0VmUUo/jAZWP5vit9H
	nRxR3SJmxNWjddLDPER7kA3BrtYdbWq/QJO8tCIN3B4HlfvsXRu+iZMY7t0KclKO2dGlJKWg6p0
	ek4WO0bbdERHPoVytPO9OzBt+c8HRucodlP+twcfoSmURAJ3YtcdGP9htgeSOe5k3WTy/QPvxRs
	ahPOFT3phSzll1qliD+vc3D5lisLlR0CrsWpQWDvK24tm8RWxh/3k73O6wpa6TeM3VprmzqR1SF
	T58dAnTQc5ZM=
X-Received: by 2002:a05:6a20:3d08:b0:230:f3f8:6708 with SMTP id adf61e73a8af0-23120afd939mr3772479637.34.1752211672072;
        Thu, 10 Jul 2025 22:27:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEaJAgXi80ygu92o6pPf++VPaum/eh82aa7liWDx41W+v5TkMIXzAZRRG37wFExe0VDFe96Q==
X-Received: by 2002:a05:6a20:3d08:b0:230:f3f8:6708 with SMTP id adf61e73a8af0-23120afd939mr3772444637.34.1752211671715;
        Thu, 10 Jul 2025 22:27:51 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.235.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd73c3sm4073965b3a.7.2025.07.10.22.27.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 22:27:51 -0700 (PDT)
Message-ID: <7579d920-9b0a-4b40-0578-58eab70236b0@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 10:57:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next] wifi: ath12k: Fix packets received in WBM error
 ring with REO LUT enabled
Content-Language: en-US
To: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, tanguy@squaremind.io
References: <20250710011754.559817-1-nithyanantham.paramasivam@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250710011754.559817-1-nithyanantham.paramasivam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDAzNiBTYWx0ZWRfX5FVyuyyC5SZB
 9tDi1g3AeVq/BH373/5U/H/t8Ni1TicGBxypYMm19k56tndmK2RibjKyZ4CmRFHHXE36Mcl9Bok
 P0utqCZUs7Ro/Y2NPOdFa014uUk5lu9j5HM9vXRzCdo2nS90trUFKtm1YCxpQdu9qObrtUiMTXl
 bXXg0REyUDvbFWMh3wkkKuz9kCLKVplw6Pl8Fiudu/ITAwK4XoHQJo2VOhBtPAoU+zxPZkKtygk
 xo3fXj9W7+Yi4LCPdhKCUtl04gDCJWUhJnEtTz8M4HC/abK+o/wwmj4v5oCl/F5T0YYX7BPerhs
 cFUuuJ7OutxoBINfUY5sPcjRorCzd3XpucohGE+8izfcARRTFXQ11qLTpyhmCtrWCIVbuKDXoOO
 yizSvzEIjoQ5pn5FamuIQr6SEHuYr8vNxtYKhYcl+OG1KDH7/3phX+knrnPALe9Tjus6rfeW
X-Proofpoint-ORIG-GUID: DYY8RhAIVtuEu7d-acR64tGwpbXHkOdd
X-Proofpoint-GUID: DYY8RhAIVtuEu7d-acR64tGwpbXHkOdd
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=6870a0d9 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=qj7j/dCbgmX8y5u3oU6Y8g==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=p0o8ilPX4fJNFhDpVC0A:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1011 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=954 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507110036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_222754_641392_82BF9009 
X-CRM114-Status: UNSURE (   9.89  )
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



On 7/10/2025 6:47 AM, Nithyanantham Paramasivam wrote:
> Currently, packets are being received into the WBM error ring when
> REO queue lookup is enabled, resulting in degraded RX performance.
> The issue arises because the REO queue LUT TID memory reference is
> set to zero-it's being assigned before the memory is allocated.
> Fix this by assigning the REO queue TID memory reference in the LUT
> immediately after memory allocation to ensure correct packet
> processing.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Reported-by: Tanguy Serrat <tanguy@squaremind.io>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220282
> Fixes: 3b9cbce6fdd3 ("wifi: ath12k: alloc REO queue per station")
> Signed-off-by: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

