Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2A3C43458
	for <ath12k@archiver.kernel.org>; Tue, 30 Jun 2026 12:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XVybOcRg16XfrgNggKu8Y+wvhvzwAUuWo3+dmdHPhFw=; b=VWw6ISmujav8IIMvpGecQpyQVE
	opbu/X8mPfFVcllvWni1KwT6z5ar4h0QMVlJpvHo4d30aiOGVr5xkN5BubSDNvmNLACdRiuewJyzy
	GrQdsgZ8w/MTolPFDXtSKRQoeYf4bjf/dnoLEfV1P2K7fVkXqTVy4Am9HgD7riedJ54+elFmqvCQK
	na3cNlKwXhO01LyRTgZoTLwSZ71zbTLc9uceUZ0myk5VdHbizHEWdmoupSSqfmPxtROJ7Sb0MObkP
	iYX1wSUAbyLpxDwrzr+2+QdLgD+DRii53mqh27trWm9JSNX3VFQKwEKW3tHqMhEsolDVihAIcNZOG
	JaSQkmcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXh0-0000000H094-1sxT;
	Tue, 30 Jun 2026 12:35:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXgt-0000000H05J-2MxV
	for ath12k@lists.infradead.org;
	Tue, 30 Jun 2026 12:35:53 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mxlg1613392
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 12:35:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XVybOcRg16XfrgNggKu8Y+wvhvzwAUuWo3+dmdHPhFw=; b=TGPyUaeI7PD0l3ZD
	RXUKwjXocsLqVkkLw493t61d5m5eW5p+GjrblI3HaXwFRFAJyCt8ufcYOL5UMpRs
	ubYftG9AINmVA1xjbKA4MA4O8GENkvzEA/LJ66khEL8Q2SnIjCkWThxNI2Exinrx
	CwNBvO3PSUzn8cYCaTzD5Sl6TUsgjTLZsqkyo89x6+0b/eEMdkChPeMQPDfXxqtc
	xb8mu5qnGtm9zd5IB+jXQLsXM9qt5GxT54Fx/vfUVEYcCnYa9T7TQ6r+4ITYjvUP
	hEA3g2zC/RyAeRNdFTCngAhd1MZnNOYdxGSs2+9rKxnzRV74z1aCc8adLqc1zcet
	HODrGQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3x1cuv52-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 12:35:50 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-96929cba004so119483241.1
        for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 05:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782822950; x=1783427750; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XVybOcRg16XfrgNggKu8Y+wvhvzwAUuWo3+dmdHPhFw=;
        b=Muv75VUIjn84v5fE/JJHN0jX5J/TCm5no+OsJ+UomjI9bY/TBUfJRDJsb8HwdbOj+1
         ZFVCH+CtH+i/WY40+H3j2l/5GtAeAbyBGnLUCbyljpwEwQgoeIOKiQto07o++dIB4YXc
         VcNXaEL1HMxJWREmW5G8scGoFsEdnMNa7Be73rra5UyQ83+xTNfXi9prx/nodyEOdIM5
         L/LP8P07QpL5EQBWJKvz2xUlQyikI8FBCqjOD7m1TJafLyaOUBM2oIz6CPjCdrHdCEiu
         6tL4ubjGbaDTyBHIopQn9/sA5/sfoxXnqvyW9UDhZcC6eFdttGHUPIFgUbSKwTHqsAyi
         bPaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782822950; x=1783427750;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XVybOcRg16XfrgNggKu8Y+wvhvzwAUuWo3+dmdHPhFw=;
        b=Vg5LU+E7iu7QlrROAyail0KUK+vbsT4J+GmopI0Dde6t6zbri38SqN16pVhyGMG3rc
         o2cvgMfhpU2FZgGzQSsOEM/D2icmTDWLJ0oY2jyBfK5LJ6J7P3XBwfdrTfHqISbuC5Va
         B9LJRzmeUuU9FiBd2tbySJCRI05kUv3nebulgrPB31mW1LPlN0T30tJUUyRaszvUwum1
         DtsVgo0mFjMvMWZhAB9GpyiYlsg86V+5hCnyOBoj4rKImVfQWBmscz1VqtyRYJ61DXnM
         vRftIczzpx5cCwDlxySA16oEu/uLQYwAY8W7DYPg6kgZxVBuDogdwytEy6NdUtGmtWac
         yxfQ==
X-Forwarded-Encrypted: i=1; AHgh+RoJQTx88ZV78tzpGTtBgFnQra5ZzAblxSd5m1WeYHmlwCG/EPxkG8J6ISXpLMG7h2YqpX+TGOI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzFSV3jyL8OIEW9QT9dcRmeo7DHKhXiJnoaD8Bg2pYiQaeBdntW
	XEdAQy73qc7E0VT4HJVB/rkyt7kWgJ6dWXLJ4VUCngW6gzaMc2ZApEJbaw17icyzdi9GfOquM2k
	FZUupOfpQ06yOEAbr4WF7EHugIy2AcEPwp2gE9V17ES1Kx6SF+PJn6JntplNO4rxp
X-Gm-Gg: AfdE7cnkGcmMIdt1vVYBrvIrI1PJIQFdpKfAb2cW9gDO0jIZ0VLsptwzelq/vQBS6JG
	5L2LT75RyJG7671o+2aaZcJIFainVVpqlkS2wQyUX1demZ6Hy4QTGs0taDawPRH6tQf7zgQq2He
	QSBrgeO/iye6pm7CxA3ciGTY0ZhFm9uWXMbmXcFwn4mnvEelD1y5piTCjkp4ojaxv2gCCounacS
	ZrKyWUPYzO+2hVfNLs4nGZVU+1CJyIYo/hPee4SVA5FUfeOFb+wEuJuqAlx7plPUlWYTq1CE6in
	kn64XCZOH+VXUA56N4fMannTxX83c9Rsg2OG/CPQItJzvMvHfoxVo7wjanZJzKkCvene2dpuCVV
	MfAXNKLEslBr3fwO0a7kMjl2NUSn0edr/uxo=
X-Received: by 2002:a05:6102:f89:b0:738:9abd:9ebc with SMTP id ada2fe7eead31-73a333cbc93mr634700137.0.1782822949908;
        Tue, 30 Jun 2026 05:35:49 -0700 (PDT)
X-Received: by 2002:a05:6102:f89:b0:738:9abd:9ebc with SMTP id ada2fe7eead31-73a333cbc93mr634672137.0.1782822949547;
        Tue, 30 Jun 2026 05:35:49 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69885c9e8e8sm441434a12.16.2026.06.30.05.35.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:35:47 -0700 (PDT)
Message-ID: <049a4aba-1c35-4a47-9a34-25e76ae8e72d@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:35:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 05/14] remoteproc: qcom_q6v5_mss: Switch to generic PAS
 TZ APIs
To: Sumit Garg <sumit.garg@kernel.org>, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
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
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260626133440.692849-1-sumit.garg@kernel.org>
 <20260626133440.692849-6-sumit.garg@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260626133440.692849-6-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDExNiBTYWx0ZWRfX+LS49bRkrmHY
 6UTn7T+ZTAiQuP5xCdAhKDzcyjL2YqS0HkW5kGEaajuGGxCm4TJMTMYykHqWUeqPxYXDKLnr96t
 ToTp5Dd3JrwHYT7yK0JgpdkQrm6/TPZ+Jcz6104R3SLLbLbfnbXjCX338dbZJQUKSm1NWAB/X4y
 7zkHGQn8lNiOXyikYSeZxFipZLBfX95oLQOFqWoOrVtixSo+Ihnw4b1XrLk6LgyT1/UcoUbsXuT
 xfOlY9xOv/HWinXze/a9vBncNCVQYxADocDuDH5hYyU48VpsWPmwSFcwIYakoCGR5iksxIdfl0R
 dOrezUhIlXglTQcRrwX/ZjZy+cB30vu7DlMQOclPgKlYLfitMCiBxUxT/tuPhLRJXuuz4f8cD6J
 mEEZ7dkVDGm12a4CdCj+6sINzVZ2R03wZJgO5lYnRZxtBhGpLaYx1e2axLq/O3RoB7OuaKrD1Pz
 ssFsBoYX/H5pKh7xVug==
X-Proofpoint-ORIG-GUID: ZAypM85ssRjYP4M3EnO2AMc5PVnAmV6h
X-Proofpoint-GUID: ZAypM85ssRjYP4M3EnO2AMc5PVnAmV6h
X-Authority-Analysis: v=2.4 cv=ftfsol4f c=1 sm=1 tr=0 ts=6a43b826 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Vkn3R3B67r5ClizzeDoA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDExNiBTYWx0ZWRfXypFMzSqyqMCf
 T6e0falo9o3NwTjeJkQgudIAVTOaMOVw1umQ98DYgKqZKVHjsM/RJnxBwcRE2poBp+595/Bd6po
 eaUXW94iI2KkQgys7fthgZr9rER5cRk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_053552_315135_EA7E4604 
X-CRM114-Status: UNSURE (   7.99  )
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

On 6/26/26 3:34 PM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Switch qcom_q6v5_mss client driver over to generic PAS TZ APIs. Generic PAS
> TZ service allows to support multiple TZ implementation backends like QTEE
> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> backend service.
> 
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

