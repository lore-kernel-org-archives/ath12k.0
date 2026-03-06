Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47ABFFCC06B
	for <ath12k@archiver.kernel.org>; Fri,  6 Mar 2026 20:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EiYJflmZS+8yawIrFdYuvTAy2GFP2luKLW8xrlAeVbY=; b=bjaipumJqMz+KScA/tyISiFsBj
	PBPi1lH97wxtRTfeCkH3wDzXr0i+iVdjohR3VVH6xf9mJNmfQJ3olU6wacqZVCw7hwKshPjrApXge
	kpwPRdMKAcMrVKWquyRISZMxNIvefruxtVTM7JBFcFGY6/4FfhsRQYQ8ByDkRcF9xl2eQjJIWof2p
	RY6njTbJyLgSCsniNYgS6Mdzo1D6Fwr2YEzQ80kGFSW2o1ci1p+sF+IxqtEadoHDRP+JXZRqRy3OI
	z09wqLkaKb11JavwCKhH/IaO6rcDJV5zY6Lz753UlCkyou/m5J532h393YVDaubzdgG0qwDaE0pT1
	H8Ge1+VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vybLl-00000004S0l-00Jh;
	Fri, 06 Mar 2026 20:00:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vybLh-00000004RyR-3gKg
	for ath12k@lists.infradead.org;
	Fri, 06 Mar 2026 20:00:39 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626H1gph238675
	for <ath12k@lists.infradead.org>; Fri, 6 Mar 2026 20:00:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EiYJflmZS+8yawIrFdYuvTAy2GFP2luKLW8xrlAeVbY=; b=iolXTHdgTdjfeOyD
	ZD1CaIv9BfKoTip56GVafVAI2pWYzNyMQHZIxdjSM97kmc9JYu7asDOGkKqXqzrG
	D7A6EGYVAir86BPd0Fn5Q7raSMDJWV6EdF1O3A4hsajmSp3swGeGIcffEwCsft2n
	6APlbK6ZVqMBM6cG+C7pk5Kyz9Fnh30veQDKzcgTG1qjkwGPUVXTxVRF9i+aiQDC
	5JqWWkql44Xvn6k9P7HX6IFX1mIcJWe549u1vpndfMKiUifO7bDmCekNyqgD56xS
	T/BL//RE4mKtCpeGpFZaumI8aENVJTpmUafJihIs4uiLWyozER6TEuIr1RntP5wd
	ADUk7w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv98j144-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 06 Mar 2026 20:00:36 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bdff07d8f4so9464013eec.1
        for <ath12k@lists.infradead.org>; Fri, 06 Mar 2026 12:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772827236; x=1773432036; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EiYJflmZS+8yawIrFdYuvTAy2GFP2luKLW8xrlAeVbY=;
        b=RxnyDd/WJvx8+Mk5b5GDyjFsoaNGZhdf3pyj/2D20qkCSzKnsVPIVKHS0zH5qh02IY
         tX60D/ojLXQD3J4/s8LwCdOH5Jk7+TgCBXhPrc/RCC1aGXvgTTIozlobjcLpe/EknBzf
         Ml6WO3ewxSMWVw+G26fPdErj7nxXKuGx/rxF/CYuXxkNX+wpEUwUUsiBtSUeSe7QFeb4
         J3YMWYQmqvx0Wje3cDo/pUUahZuxE46sT5U2Rg9+2NsqAlwVuFcHyVQjj8zyuwEqtSsx
         vfDB7ph2XSE+lD6Mp/thlk6py8v6ZyMYx519PmdYdKjEUBkvSsDjJHAbqc+R6ZsxS3As
         Wcvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772827236; x=1773432036;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EiYJflmZS+8yawIrFdYuvTAy2GFP2luKLW8xrlAeVbY=;
        b=FDawR2z5bTa4QftO/dKCoAAQ8IvDoXJT+jIjggMCtYpNIaNJRXdr2ghGGhhWXXkXR2
         FwGmilid/WBvIMCvByTj8QHrXMgvLSG+ZY9IrIjx724NfM+4BoHrDmdOGCSkBq8wLmry
         wPp35VC7fa+eVWGXuR6bDwDrAtaVcuRaT2EMqOzqi0jO9ACpCfvlln44uqBE3wMMOaCw
         7f9M4fnLtDtLzIsSZwY4tR0bKrP1ypGjUsRFh8bx+nDbZe+0kWWWZpR85L22/+CH6VK4
         qkP+9FxQ0x26/8X+Tv9468KLmH5p1d+dGlHcmJUrIHfYHuy+R36qra9J/wiRKEBHQvJs
         tCsw==
X-Forwarded-Encrypted: i=1; AJvYcCXJHVMe8hLrlmSKrOQ239ysmS8uX8FRantqui2J8Fghxwp1UFOpm40gVdjciCkw8iIzTXmTDTw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxUubVsqoHARz3qmZtWtwY5aiaQHloqazOH58LsfL4hwejc43dL
	wO+SModdhJgwkw2hQ7htXN3MsG+nVT31XeiWnW8+ScySXiyBL8VBnvxlFGD9aYl93TGTaLnOqMe
	Fpmw+fXPBKugyw54sULgxZZhABT29zg+/n9e4QCe6xbWnOw9uyW39jLxAhZMhWDLD
X-Gm-Gg: ATEYQzwbZixKK57c/oJ7ND3Ki2oIPHk01WgAevaGZVtw3pxAVf6rAJVGwdKaKeVZRfh
	gDyhi7jcyD3dMO5rbeCpcnXeBhL1d4YOh5ZzGWXbPLKyKHyT3s1biqjA9BRNmkU6W1s8kqVvLiH
	vFjlq/gpP64enPkOFy9sIcM7vCJEywAc3Lv+P2dbi7hZQGpT84kKbUP18zccRu8RT7Rfg6oLcqy
	8lJD+RtTFDUNdaN9Rab7YfCp9xx2qTgum+IzcClbSokABbjxJDJAVtnZcle9twGs20Wl5oMyDff
	1klltaokxiw5KQIEwk8YStnleqhe6iqcuSEPLLIJHxm4Q+Gr5E4T6Ln6dhwyNaZKihkyx8Tbwbz
	zjRna4C4MrJtVhbEHXGHxEn3mOadHRTxtRzIwCSZh406miS9YqKqprhA=
X-Received: by 2002:a05:7300:a887:b0:2ba:7069:686c with SMTP id 5a478bee46e88-2be4e01911emr1342895eec.17.1772827235515;
        Fri, 06 Mar 2026 12:00:35 -0800 (PST)
X-Received: by 2002:a05:7300:a887:b0:2ba:7069:686c with SMTP id 5a478bee46e88-2be4e01911emr1342841eec.17.1772827234438;
        Fri, 06 Mar 2026 12:00:34 -0800 (PST)
Received: from [192.168.86.165] ([76.176.48.107])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f96aa3fsm1798784eec.24.2026.03.06.12.00.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 12:00:33 -0800 (PST)
Message-ID: <973acaab-f2fa-4e2a-81ea-9d7fbebd1ca4@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 12:00:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/14] firmware: qcom: Add a generic PAS service
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
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
Content-Language: en-US
In-Reply-To: <e0a86461-c136-4371-99cf-c0b0d31443a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: A1YPbnACKZVjA3vFnQ8OhcFjs-TQv3Fo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE4OSBTYWx0ZWRfX8f3y0lUUTFrT
 7QoxFbCY3PPd27f7vtQtSrSLdbcxY1us0mycDpw/Ua2k8R/d+PAA7ZoR14Mv1j4kx6Rt69O9U2i
 60yAahljpq025F52balaUknSZYnDmXBQPcRI+T8tI8CTfTvb/SVTKpcFER+Y+dvFt54Ef6+xz4U
 9NzdcfnDriM/NhSkyV2EeXGYX3DskA+xAL7kq4kHYQunsqQEYclP8owQXo+1Ig2zHgRXqKx10hO
 zYXy5o4dzkuzAxDktfAqLb7HZPV71fVbTdzuz/SZZEVWYh22EGh1QFsnKyU+XvFHF7MNyQQTGbp
 cQQOms5OvqnN4g/01Rn2mfHBukjCC+e0CeMP4BaIvgY47vEYcrXW6yuPFKHPL3BByhrcIFvkXJR
 WvSeKC+zPlW4eEuz6oNljJHw1qzuwq57Vw/OWUsSXjmQODQqDxc5u+L7fx2bRTEgfqrBgohEUf0
 jYYn9x36194kQH122tQ==
X-Authority-Analysis: v=2.4 cv=LbcxKzfi c=1 sm=1 tr=0 ts=69ab3264 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=lsoD3MMNObdLvy1227ExmA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Dui5BcQmNnZPeg-S7-oA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: A1YPbnACKZVjA3vFnQ8OhcFjs-TQv3Fo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060189
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_120038_039374_7AAF1969 
X-CRM114-Status: GOOD (  11.08  )
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
>> diff --git a/drivers/firmware/qcom/qcom_pas.c b/drivers/firmware/qcom/qcom_pas.c
>> new file mode 100644
>> index 000000000000..dc04ff1b6be0
>> --- /dev/null
>> +++ b/drivers/firmware/qcom/qcom_pas.c
>> @@ -0,0 +1,295 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/delay.h>
>> +#include <linux/device/devres.h>
>> +#include <linux/firmware/qcom/qcom_pas.h>
>> +#include <linux/of.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/slab.h>
> are you sure you are using functionalities from these header files?
> 
> I couldn't find slab.h usage quickly and also qcom_scm.h. Can you please confirm?


I scrolled this patch too fast. I can see slab.h usage, but not sure about qcom_scm.h. 

