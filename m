Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58446D29DCB
	for <ath12k@archiver.kernel.org>; Tue, 13 Jan 2026 05:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Aa1nzw7+y1VhWnN/zEX2SxtNWQMkYil7Jbl8sY8zM0=; b=EqC4g/E+JLt7iEQvrYmU2O8cWB
	hojbL1HsQIVIHMu7wCLaoYOcJpd54/FeGLcncx8xnQH536l7fc0/Rdga1uP3yPoEz90bZZxDk8652
	toA09amTgI9Sl9QTPjjVk2TqsOgLUTVdjyc8Aik6wvB6NtyoaCduZFkfcsg52yHWtz0felfIBlNu1
	JrZ354YJa7buUNEyz2fhIesv//gB6F8nNlwFoYNIl3UmXz9ILrcomJfcCnvx89VRcA9m4ad2+gn5R
	hVsOsjcIwHpTkOYfYtirlZuNYVCf//5qJnHM8TzpWF8p4W4nJoocU/YDYHlgPskXxJ270Hr7O++jA
	8E7c9kdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfWhN-00000006XHW-0PKS;
	Tue, 13 Jan 2026 05:12:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfWhA-00000006XGD-1B80
	for ath12k@lists.infradead.org;
	Tue, 13 Jan 2026 05:12:04 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D536Ww2865791
	for <ath12k@lists.infradead.org>; Tue, 13 Jan 2026 05:11:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8Aa1nzw7+y1VhWnN/zEX2SxtNWQMkYil7Jbl8sY8zM0=; b=AS6YNNIYdvySE3rd
	Tcw277XPOUzmx0lf3yLMTJ4ZDlCjt+/iF/bMwPSnjC9YmsM2j8Usuk8HuOKQAhOw
	j/HhaJQn/utnEv+YbcLKEojorZpr2DHzwnYNMNIIxKPOZ21b7ksChU1ddmtj6xvn
	yUNBNUG30g6tg7qJd5XALOMjx51MlhKET93BEliJU8GSj0Tmj5DiN+/+K1Ye2Nqo
	q8ZxMmRe+vMvPA+xCE5AXehvHnLL703ghEEROVSiLOUSKA5FFFJ/AJkQHgcLIRw6
	4CHBXWddDgSixFW9mNOab45jz4ZWD2OIhTwEVtqVK/lNsTzxAc6ywDeRVxSknbpR
	IoknCA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnfjh80pb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 13 Jan 2026 05:11:55 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29f25a008dbso50989215ad.1
        for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 21:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768281115; x=1768885915; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Aa1nzw7+y1VhWnN/zEX2SxtNWQMkYil7Jbl8sY8zM0=;
        b=KVt4Cv2vqAlKBSr7qh9QHG1ZxEYELeV8Xzg2POjYdVwJiCeulDPewzD2KEtJ4UrEmj
         KDiDKhraATXh5WEGvL91qMTGnewyQHZowpKvtm3XvNtKYMCPkROUazc5DYU/XhtgKFuC
         MpSZj1BfuCEcm3hFYpXGZvL9FoYwl0DZ9Wjo9u1bHRzKkQ/BoUq8sguR5/Wc9iz8P8Oh
         YWWia3b29K+oIz3L42omthJYXO9XXkA4VNNbyDfxp76rZFY1+NEM2q7mJo8GqoUVsn3D
         89Lu856562Pbsfo5qmMvZX9hXc8dNSk/zAPv8wS3BNeOrDArD1TAbLRROL9kuBvHXQUd
         2XUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768281115; x=1768885915;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Aa1nzw7+y1VhWnN/zEX2SxtNWQMkYil7Jbl8sY8zM0=;
        b=v2ocK07vw/5rVxBchcCO/zRdVOuf5B/1W5ZeEwExykcpa1yL59niQGYyc/+i+Rw5LO
         4QiBKL8nswWE6e9x6RRfWxRm+L5/UjkM7N+NrY3dkHOeSpPTN1rfIBTjCdMfF0ffKJY6
         Xc2DSIYqWhFrmFlUI/IofZ5zcYmWtqGImVSwbduZ6aK0FfIx8U/LqlSovSMENrQ4T40Z
         6D3duQEW80yc4QYe8Bd0K0chyYbEto8f1xTPt75ACwzR0xs+7EwV8sYsvrx8BSuSqCJx
         SQmC/FPmfOOXPylMVR5qXIVgN0gRtuRRMew3cDXuD1VvTrSSASyctce2BbBDNX3Xwxch
         E4LQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnjUaxSPlRsqL3X7VHuXOwxhO4WvA7Ccxwd9zWy8VG2nsBVONYbGsPML/6jH/y06XKH0nxGu8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzpYO8RRdYOUuBdTliQw723oWnpsPchAL4IUboBxL/TrMotLl0S
	683qYX/dWnTS4ihsiU3yGPhneyKfNPlwjJ5CIw/tK0zNMX61z43ijIi+/IQ3R4MezzAY08DazS8
	o/UynmsGm80g/VxySPhJPOc2FtmhB42U0Y9fjI3o1iYH7HtVhTT9FjOmhrPn0TadZ
X-Gm-Gg: AY/fxX6I+4FzuOc7uIPdwe7nFKFwxRpUYjTDmRpesgGq8fhv7MQtz5vG0sZvbQd7jh9
	8jMAIxdUSDZbVyDxU+BHJ4itQBJlU/15zWc+CkbIGKkq8lTIu4gnEbSW6eE9eH44fIXkZ3QQ0IG
	AKQyPIrAdvjSQkExoOgn/X/Y3KJYe11KA+rProusYOpgheMSNb7xuDldzclfaQ1fQju5dO3+P/o
	wtpnjQHBZfGkR5YF2EfIgcuPhK9PYKoIHXQDY8Q7JAGxnW2gSbiDor01NoRAZ6fHQrrpgSbnu96
	YUHu1dgfUjscQ1k8Yk7JOH6gpGtsNFus+58XorViVmOMy3zhK0qH+4xJv4Uh3/5L167s6vrF9Km
	gyloY/NqwzLvrHJnlwEcW7J+KuaFL628Q89A45/H/qfcw/ohr70SDSGQ=
X-Received: by 2002:a05:6a20:1581:b0:363:b975:2d80 with SMTP id adf61e73a8af0-3898f8444c6mr19052323637.13.1768281114875;
        Mon, 12 Jan 2026 21:11:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHyu1wWxLwbxsyrgbviogjx6rC4x2l3qjNLqxuWz5zVR/HUw0RClylu0/Rx6Hkd/3pvPl8hFQ==
X-Received: by 2002:a05:6a20:1581:b0:363:b975:2d80 with SMTP id adf61e73a8af0-3898f8444c6mr19052300637.13.1768281114419;
        Mon, 12 Jan 2026 21:11:54 -0800 (PST)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbfc2f6d3sm18763026a12.9.2026.01.12.21.11.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 21:11:54 -0800 (PST)
Message-ID: <c258e1df-491b-4622-99a5-a276eb6c8fa9@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 10:41:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath12k: Fix scan state stuck in
 ABORTING after cancel_remain_on_channel
To: Yingying Tang <yingying.tang@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, yintang@qti.qualcomm.com
References: <20260112115516.2144219-1-yingying.tang@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20260112115516.2144219-1-yingying.tang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA0MCBTYWx0ZWRfX18MBs4jwQ5hg
 e7DX1NeaRoYlM5sgCZKNvQjvc0vNJU+tZzOBb1NIqCRDF0NzAOaQKieF3RoDUvsM44BZ8mgm0v2
 CLhbvuMeOfswQPVh6ye1awiLbKdol7z2SeD/Oo1DrhfiZMFrESHwDxuqvNgcbARP5j42dIbi4Xr
 9yMwcqbB8lFRNiMh4823vQyK5o0O6BpxUFUBwrXcJDFyRd4tLTyGA7t7tErLfswwzZlDUnG+pJ2
 gDSXd71V7YO8oyx2tBQ2EOO2T6RkGDF1AifabSNlc6A6hGIHpO2Tz4D9MyUvOntDTZlIBZgz8bn
 tQT/mzMIXxRWmBKnoXLRDjEtyEh7L75k/yjqdVZU+jLBC7dOZ4oMQyx0xqV2JC9H3esT450tTGp
 pMuCzRLZIX/HzE7h/m/8I0Qpk3wetZvB/hNsJQuJOiD1+jlIbBN67tZjYPESZFplAYFUh/zIRGM
 9/DkxEQY7GXRbmMfA7A==
X-Proofpoint-GUID: OCBcIo4z6CfPWFkDZi4SYoTUGnfYo_qM
X-Proofpoint-ORIG-GUID: OCBcIo4z6CfPWFkDZi4SYoTUGnfYo_qM
X-Authority-Analysis: v=2.4 cv=XJQ9iAhE c=1 sm=1 tr=0 ts=6965d41b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KdEc0S3GmNI-KGd16cMA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_07,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_211157_918622_33E2AE96 
X-CRM114-Status: GOOD (  10.99  )
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



On 1/12/2026 5:25 PM, Yingying Tang wrote:
> Scan finish workqueue was introduced in __ath12k_mac_scan_finish() by [1].
> 
> During ath12k_mac_op_cancel_remain_on_channel(), scan state is set to
> ABORTING and should be reset to IDLE in the queued work. However,
> wiphy_work_cancel() is called before exiting
> ath12k_mac_op_cancel_remain_on_channel(), which prevents the work
> from running and leaves the state in ABORTING. This blocks all
> subsequent scan requests.
> 
> Replace wiphy_work_cancel() with wiphy_work_flush() to ensure the
> queued work runs and scan state is reset to IDLE.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
> 
> Fixes: 3863f014ad23 ("wifi: ath12k: symmetrize scan vdev creation and deletion during HW scan") # [1]
> Signed-off-by: Yingying Tang <yingying.tang@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

