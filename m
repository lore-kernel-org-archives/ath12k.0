Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3571CA0EE8
	for <ath12k@archiver.kernel.org>; Wed, 17 Sep 2025 03:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AMuqU4rto6Tj0kKX2+FmkQgPqo1rKzpdESKn4BxVroY=; b=RYnU4cPaejvWsFGtJkssBZIgCt
	fk3SX8tPyIXhqzuxABjNoqTzvZ4NwFAE4yKfx/wU+OP9luVucoaFnjcWPq2ML1BfGuJ+Xz9F8YL7O
	pGTadEXnyTPXIjxBc1upPaGeCzdCXxMxisR1+GaY1u2a5mFJ/3rMyqhmic0Dv3x4C+u+jGIEbVhq0
	ed1RnXxzJQtvNrVsXXl7jpvUdiVLr9BTHsRW73DeHzoOiKfi0ZQDGGrtGS0R0YDtdkFXKwznW1KJ8
	TkIYBIVQD4DzaPLJsVs86XY9VZwIHkHV2SoFZ2rwZuBQZcVy2ibm4wo2VBI0KPbZl4qWOMKPeJXMn
	g8KxeiTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyj7O-0000000A632-1SS9;
	Wed, 17 Sep 2025 03:46:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyj7L-0000000A62Y-1AUd
	for ath12k@lists.infradead.org;
	Wed, 17 Sep 2025 03:46:04 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GLZlW7017834
	for <ath12k@lists.infradead.org>; Wed, 17 Sep 2025 03:46:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AMuqU4rto6Tj0kKX2+FmkQgPqo1rKzpdESKn4BxVroY=; b=azFY920c9ghQDLkf
	fX1sqqg7aNP5Jffz9GSXh2VnR3wLXWdhE/kAGkT1J/6ydDFjA2lj8Bu75q+vf84Y
	HAzp0fPEqxhxWj5HdgwyysKxmo6FGp63iIJB86ImYVab7kK3JtyPW33HR4uCkiE+
	PrzdVmXHggxIPTwxuTTOWAnCnniiQL1A7zCUo6MhbbAcDCJXunrXvRw3jJUO3PED
	fGkoCLarGOX0u8YngLPc8fV1rszd5YPTrAfGevKaUU0MesqoqET6VuYMDWe63u0Q
	6WLWbOU7O/V9xBvxaUQ4ziZsDS+q69RMe5nZ+f3SsAn9NOYepWcPRygz/fH1zm2G
	+Q6abg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxt0sqb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 17 Sep 2025 03:46:00 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7779219ccc2so3329386b3a.1
        for <ath12k@lists.infradead.org>; Tue, 16 Sep 2025 20:46:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758080760; x=1758685560;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AMuqU4rto6Tj0kKX2+FmkQgPqo1rKzpdESKn4BxVroY=;
        b=dkZgqxhP4xuofv5VVKMrymGjTpTAZMAZzu6+rQLw1NG0+l0eiJF1e9JZlKMmk5vJNz
         RR4jGaTB+gUFY4ZOrzSfZADs0h7AwYLQw4b3D11fjcclB7/ryg4qefNLi2wK3UZ/vmRl
         Jv9Y/+55g1SNkfB6JFgHTX+oik9PvzP/1kRPqwO4dSF04HfUUXizGJXxZj5rrW0FFHuA
         jBvfjeL8+ssuoobajoEzVXfKIlUw+a+Dv5UR8SZ353yjdQeYhct4sDavyoBIVUCKHAVU
         djVYjRA+hgyeRyLu71HaE8TEd89FqPIH8U7IkPe7ndGKsXZfwJgHjRt1nNYkmRqiAJky
         QlsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEeycyo30kXuWn5Tcmi1wDGYAtkxnUWPmb+SOBBt8MJ9cwEJ771BCTw8mig66+vQD93YeQrak=@lists.infradead.org
X-Gm-Message-State: AOJu0YxpQEA4JcccyHAmUP3MDd6hW0+GI20/xxYxD6a18iEABamYWkVT
	c1pm5MYDgcUIivCsQaULHqwJY47RzS3z5C88vn+GOJaa8m9iI5yi4QUVOXveucSynY7PFSAdXXh
	LYH3E4J/N7CSpfUhajf0tQA7khXh0TsoWOl8tJosto2FkZCRNQjcDKklw/Ab1HhYQ
X-Gm-Gg: ASbGncscc5ZgR2Fd5BC7AwcpZJI+NK18KHJf+2AXBlES63loR12Ouq3tIwZlNDX92Sh
	WFumnyghOT6dEcfrA1dAlod59saPn+vPTZGg/1nRwjr2wT1o3FOnclMrTrvf82CuiPo+/xqplZO
	1Dv9fJKGnlZ5KYLn+4O3XyKsib4VzXwBhTtG/hUWr8cM5DHIteB2crxN79kr/S/2mFtz5CSj67C
	23/+k18uSEJBBfhVuiLk9q9QyHCR/1qoSMW0SheXESYtGVjvl6mR0LQoFcusvq23tUc+V2B1h/W
	7AZZFJwSTlk/RKEZRv8yqa5S+YaxqD0+55N8OlACKYPiyQN1ImxbKHviTvf/jBBDJBDzpucjV0p
	VwaOhn4GfPLs=
X-Received: by 2002:a05:6a21:6d94:b0:240:1d4f:720b with SMTP id adf61e73a8af0-27a9760c9d8mr838024637.23.1758080759691;
        Tue, 16 Sep 2025 20:45:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0SDPT67Q8/Cmh9y8XsaaAI5lLTinSzkTWY7gbKUtf+kghwj+ZUL4wfYqfmIlqztAHU7GdLA==
X-Received: by 2002:a05:6a21:6d94:b0:240:1d4f:720b with SMTP id adf61e73a8af0-27a9760c9d8mr838000637.23.1758080759189;
        Tue, 16 Sep 2025 20:45:59 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.98.234])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54f4aafde6sm30670a12.23.2025.09.16.20.45.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 20:45:58 -0700 (PDT)
Message-ID: <e2809c34-7002-f189-a10e-21695b529ee2@oss.qualcomm.com>
Date: Wed, 17 Sep 2025 09:15:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: fix 2 instances of Smatch
 warnings
Content-Language: en-US
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
References: <20250804-ath12k-fix-smatch-warning-on-6g-vlp-v1-0-56f1e54152ab@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250804-ath12k-fix-smatch-warning-on-6g-vlp-v1-0-56f1e54152ab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mdrsENiPp-u2McW6toR9mjcRSaPKICfT
X-Authority-Analysis: v=2.4 cv=bIMWIO+Z c=1 sm=1 tr=0 ts=68ca2ef8 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=r0KOKur2OvuaYElxfjaavw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=BoDogKCtvrOBLCu30DUA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX1/+JeOnVX1Q2
 Np4XIarFtKuGmhzebbxn0tWpfPS/SHR6kcS7Z8lIsqny7EjbJsLh3384yWuRV94kuqCNDvY5J5u
 EPwHvDs/FAn6f19Hm0WuHJBqKGwtS4UY7BUZit2SiTkMbrxPqOZuuSknUB7KZHpXbAtGRcXnKYd
 GN7GQzAR7wT1X05LIDww4lQYEptuV+pDxMvUAW7KwGTFKNlYkzyioQQA8E4ovbHOpIcgxoHrwDi
 cwtO7WTtAVUal8Dw7qozpg7YgAzo+U4dYg0w6Zc6sggDNPUf7P2xbNi28AgQjRMJd7bxA3UrN2L
 02cWeDzVo7hdmx5Jj+Zb+m62F7xH0Ncz6mgDFhJw3OA85bHrJlWWxUR/FLyUh2/mEEbO8T+o9QH
 10ERk4fD
X-Proofpoint-ORIG-GUID: mdrsENiPp-u2McW6toR9mjcRSaPKICfT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_204603_331641_B14FB247 
X-CRM114-Status: UNSURE (   9.99  )
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



On 8/4/2025 8:33 AM, Baochen Qiang wrote:
> Fix below two Smatch warnings:
> 
> 1#
> drivers/net/wireless/ath/ath12k/mac.c:10069
> ath12k_mac_fill_reg_tpc_info() error: uninitialized symbol 'eirp_power'.
> 
> 2#
> drivers/net/wireless/ath/ath12k/mac.c:9812
> ath12k_mac_parse_tx_pwr_env() error: buffer overflow 'local_non_psd->power' 5 <= 15
> drivers/net/wireless/ath/ath12k/mac.c:9812
> ath12k_mac_parse_tx_pwr_env() error: buffer overflow 'reg_non_psd->power' 5 <= 15
> 
> Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> ---
> Baochen Qiang (2):
>        wifi: ath12k: initialize eirp_power before use
>        wifi: ath12k: fix overflow warning on num_pwr_levels
> 
>   drivers/net/wireless/ath/ath12k/mac.c | 16 ++++++++++------
>   1 file changed, 10 insertions(+), 6 deletions(-)

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

