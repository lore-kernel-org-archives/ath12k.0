Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED1BF3C27D
	for <ath12k@archiver.kernel.org>; Tue, 10 Mar 2026 09:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6oJ8QQt604h4CfSsQepU3v+GHYIoK3WGwrJxaSWp0RU=; b=S/TuvpXYkbrSNdNyUCUk4E6Urb
	sWSRUYB+5N11+rY810nzDkGZXVpWOLRMYlSkO2jrYUiK2DcLVgixAtmbmnZNGi9iT5J/BuZH8aaxU
	VctdBe2coxquvI9A0Ph1BqrR0n704m78tXc0L/adtU4vPtjTHJp9NRsAubNsN4mvSRGtjAAts/WY6
	zLzB/eZrx7BPHhSCgdVRWfHYbG9i2JjgP6aSNSahjWrfsVEC4mynTbvJfKPoZ4oRbQybxOoSgib+A
	jVMNP5aLnzZCXD2aFuEuthB1OpAsbye55COqZA+q379U7Rh8sEb1gGlGqpAf3JrLJC2R72sQ8NEPN
	cGsUZZ2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztq2-000000098vl-3xEH;
	Tue, 10 Mar 2026 09:57:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztq0-000000098ue-0nrk
	for ath12k@lists.infradead.org;
	Tue, 10 Mar 2026 09:57:17 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A912xJ3754581
	for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 09:57:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6oJ8QQt604h4CfSsQepU3v+GHYIoK3WGwrJxaSWp0RU=; b=bM29PPBAOfK0D3uO
	ml3hIfgefl30u0LjMXnpy4nUYL85G/cEds2e5/kBbiqC9ctGt0Rg9xewFlv+bowf
	xpYjgzSj4Dy9TPBlCmBXYexZkzHfOvRwjBz2rV8i+Mt4PStfAt7DZC/nAmt9Nw15
	/IGuGCecOGf3hN8IV17tfwr8mgJTSUIyftSW31id2pZu+r6nMd6ce/24ppxrZZqs
	r5rxs9J+VWOU3l0Jo8Yb7aWIKqF9nwiw5pdXy6MM24RTUDYRr+jGa2UskUuovWFO
	AA0dky8LS14sXa2uBNrJhVIdFUgWK3jNdtKlMooKWWw3+2tx11hsreyrcc0kXql3
	/YvAFA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct477jjha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 09:57:14 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-899f6011df3so54449066d6.0
        for <ath12k@lists.infradead.org>; Tue, 10 Mar 2026 02:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773136634; x=1773741434; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6oJ8QQt604h4CfSsQepU3v+GHYIoK3WGwrJxaSWp0RU=;
        b=R7pgrlQr3xWtfxnj6+IR+OblPlqCELYDHRkEZhIL6uNb4L/0l1nGJmOKczxtPuBqHH
         ZtjJuG6X6ule+JrL60Db7/qDE3HMtm5W1nv1O8uERIurz33SKIdgRnKWZSH1feoLS8bR
         w1NPi3dBemR6tcjEhG0tSc40OWy5ksCNKPIlEtJLx3i/vzf/PZMK9PmXxYB17UDmnR6I
         UY4cSV+zvwYDLPEy6jX1sn3M4p5lC8+Ymht0Hm1aC7aigfGJxeq/Jfi6StvJgV457rej
         PP3jv5FDmJ9rEXAWj5JMJs7yQkEblbieYQGX2sFnW6zwS6EmwazcGTRzjumebk0jP89C
         XRUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773136634; x=1773741434;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6oJ8QQt604h4CfSsQepU3v+GHYIoK3WGwrJxaSWp0RU=;
        b=NGW/qZGedBajff5B1x7tYE/8jb2/He4eBUCCzcwS+6VJkqCu6BC9lePz/4xMJWyOZN
         Aso5O0a3MFUW3UDyveS+STSW0Zg6c32I3yRvQJF3OqrClGLQlB/sobwuAqw3TCgd7yAw
         y1Mzr2LCa2hjPZ09FqOY6Mygtno2Y3eBKHsTEdNvSa/i0HsP1mvoi2lDiwq+b6IQHCs/
         +OH1Ep+ijZ5PVCysUe1CUchgMAa8vPvX80ZtN31LJLJAcRkGaYZFTDgzTm+u2zxqZtAD
         G7tkdE5WgQZCPcaWBqb14N9IiiO4vzsU9hkxwxB21U/UU0Eav54oXpcsUDJt0mx2wrs7
         9vNg==
X-Forwarded-Encrypted: i=1; AJvYcCWJaUsiiwBxldULuewhtKYZ2uuE9s8rg27nVHQd6z5/4w4ku1bCGgJRs90IdMa8c4lqeoMpox0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/UAWTlalNm006+wJ5v9/JpSNIX8dgIxaPvkRf4YIXZZ5Ubjm3
	EVGka6Li9DuIfilwiGSbmvO6zHFGUO5cQQCis+5ru/oXZ21oDKRd/e8/x+DnNEr/vd6TI28lFls
	PIQNfA/dD77cMCXVecifcqxYVJ1GG1D33RwDn7wQ90V3m2QGRDNYyzO84VhamUE35
X-Gm-Gg: ATEYQzzaaucFKr1A2mpRRJwOIdc8EpbWi7bCFsACscZoEG57ItwZlk1ClY5DeaGgL3P
	oh/4XOlVbQHnKCOGbsENs1elUvdWujF4fk3A7QeIelIwVysDKJKu/G0IkKjvq5Sb2k9icAToxC6
	ZZChd6nFDJyD7gQ4BHsxEkDCNn4IrD1QRiz+29U4zibyxn+00+TxBvmGM0A/QU4pO+TE89U2GuX
	XEdWb7Fyim5JDxr9fI8Sx+y+YOR87hd5rE6/uc5000xq3k3QUHzdzRphMAkzu9UiygGwaCGLjPZ
	VE7+oz0F9oUfnI1W7Pv50ZPCAcfZbkYY5xaWP/lLdWDYVAYfLCNFtJgjyzuYC9+e06TNm0B4Y9S
	pom0C4Cs/d+KLP2vVkyiPd8KneK9A6jIcMoMCOwObrZjgrHvHPFRnnql3cuLmiDu2E4JLSf7pBE
	0cYGA=
X-Received: by 2002:a05:6214:4e1b:b0:89a:49ba:b58a with SMTP id 6a1803df08f44-89a49bab894mr82170136d6.6.1773136633818;
        Tue, 10 Mar 2026 02:57:13 -0700 (PDT)
X-Received: by 2002:a05:6214:4e1b:b0:89a:49ba:b58a with SMTP id 6a1803df08f44-89a49bab894mr82169946d6.6.1773136633432;
        Tue, 10 Mar 2026 02:57:13 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef483f3sm447860466b.9.2026.03.10.02.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 02:57:11 -0700 (PDT)
Message-ID: <7d036c96-e257-460c-a91b-deee0b9c348b@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 10:57:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/8] soc: qcom: qmi: Enumerate the service IDs of QMI
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, konradybcio@kernel.org,
        andersson@kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
 <20260309230346.3584252-2-daniel.lezcano@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260309230346.3584252-2-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA4NSBTYWx0ZWRfXwIoDXmOGbt8/
 pmc8/RWX7ltKjpfM+Jr8LBCM0RL69bLZq95E84GEWcAp6F0cUEWr9WSRqVUzUuYsOALl4PZ+tJu
 Db0I+gFiFICw8mFB6Rg1mWuIXveR1qrJiESdqGVi6z/ku0WlwU/0Zubj+MQHBDAvYWbjfg0Eib3
 J0G6yFWtZKvJry9FoPw0094v8W8rZ5BqMQtOioRZBKlw04Nysm7W4qC/o0nQDocDKNaN325UOxU
 LuWDsU+kkomKl5sfN/SxrWlQr1bfY+kjdmgQcsPMGWrwRfF3LSG788OKdbgmQKb5N1SaeBA8K2I
 nZEy4de2tkyeI5xfWJp38zs7wGj9gxJMILRbGTWEm7yC0F6OqEa/riELDZfjzrJeZyfVHEEu3MA
 EPrbE4xn6mk4eZR7sdcXQjw54g0IP3499ULPbi0ce9A3uSgJMSc+7fP9GMPqY/vJwlVpFjuWqYZ
 6vadwpyU8T+Suu1aPYw==
X-Proofpoint-GUID: IVDNWjRgli6fd6psQ8cmvBMuQCMudekU
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69afeafa cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7MBKnE05AAAA:20 a=EUspDBNiAAAA:8 a=Lti85_ANQs6YWTYAGLkA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: IVDNWjRgli6fd6psQ8cmvBMuQCMudekU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_025716_348439_7625C06F 
X-CRM114-Status: GOOD (  22.52  )
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

On 3/10/26 12:03 AM, Daniel Lezcano wrote:
> The QMI framework proposes a set of services which are defined by an
> integer identifier. The different QMI client lookup for the services
> via this identifier. Moreover, the function qmi_add_lookup() and
> qmi_add_server() must match the service ID but the code in different
> places set the same value but with a different macro name. These
> macros are spreaded across the different subsystems implementing the
> protocols associated with a service. It would make more sense to
> define them in the QMI header for the sake of consistency and clarity.
> 
> This change use an unified naming for the services and enumerate the
> ones implemented in the Linux kernel. More services can come later and
> put the service ID in this same header.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  include/linux/soc/qcom/qmi.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/include/linux/soc/qcom/qmi.h b/include/linux/soc/qcom/qmi.h
> index 291cdc7ef49c..b8d07f2c07e7 100644
> --- a/include/linux/soc/qcom/qmi.h
> +++ b/include/linux/soc/qcom/qmi.h
> @@ -92,6 +92,18 @@ struct qmi_elem_info {
>  #define QMI_ERR_INCOMPATIBLE_STATE_V01		90
>  #define QMI_ERR_NOT_SUPPORTED_V01		94
>  
> +/*
> + * Enumerate the IDs of the QMI services

In case that's useful:

https://github.com/linux-msm/qrtr/blob/master/src/lookup.c#L23

Konrad

