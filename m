Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8634C5B552
	for <ath12k@archiver.kernel.org>; Tue, 10 Jun 2025 07:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LkmLQstAxmaDWYQl0rijYwctWd0n5xL/jDxvnCy/h8w=; b=1ZQ0uc/dJarfBjkEyD9n7qZucI
	r79fOBWW6waZ1gS94U9SiG0WdivbkSGGG1WkL9VH96HXvZR8977jy+2eIV+RYjQtoZSvrpY8O0gi2
	Jo+bkWo857QVzRAtXOmdCMSQbUNjnjHCJ5kKvWnP+MUY+jdmmZCtZjZ1Lj8hzisSQ7l6+8OgCoo6U
	EjeO5+tt7v5sqg4x5p7Ajmkqvfh2VdRUaNSyYi2Pbk4I12kDmGw9ZL+InZ5pRt/628MiJaaqzGLvx
	Iwl8ribvrzZsG2dCE8ipQWDE+QfPVoOWfHo82Y09y/Vd4b1lGtAT95xmkuUQQlIHmkud1JmYSZM1c
	TqFwiD9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOtiX-0000000649B-2qlh;
	Tue, 10 Jun 2025 07:48:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOtgu-000000063wc-0q7M
	for ath12k@lists.infradead.org;
	Tue, 10 Jun 2025 07:46:41 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A60Nsn002514
	for <ath12k@lists.infradead.org>; Tue, 10 Jun 2025 07:46:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LkmLQstAxmaDWYQl0rijYwctWd0n5xL/jDxvnCy/h8w=; b=GnEHwjy42NF6FOZO
	A/qWXFNCjG6zuEJF5XimW/InL2sV6f4qvX3x4oBCn12sJsjVzA6GMPQmVVhRoDxn
	8/YOSUtRucmUfXVTQ/+c0QH/EHh0rubDQ+8214WVoFXiMe37mefrCE1cGarAaC/v
	p2aCiWtWTaLKuxXiZmF13jw06X+xR7diuKS2fiW+zWZpgFmGvCiX78Yao1cNVAfB
	fY+dfjSIVdBijTnXsxbiuYFbgfHrVacfilR699yZ3QPX5IRMplwX5PnzzWpn1R0h
	1Jj7HqEYPenwwyG5H+o236VpXYW/UD3qODzx6C0g9V1CEqR5pIGb3cYGafZ1eEbu
	HB1a6A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2tb83r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 10 Jun 2025 07:46:37 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2355651d204so48434875ad.2
        for <ath12k@lists.infradead.org>; Tue, 10 Jun 2025 00:46:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749541596; x=1750146396;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LkmLQstAxmaDWYQl0rijYwctWd0n5xL/jDxvnCy/h8w=;
        b=bp9A+vd46F2QDWzsAqA5ibHIQ9lQUYsx0nDUxfbpF/NoYupErdw2u4U+D3vo/HVgtN
         cw05XzPfFg27htKAAE1EsL2lPHIkLbGaZYkOzcqMKnEzTsuPSo4jaLAdBME4yu2LS+b9
         lxkSzKXUng3easj0I9quKqHF6kGgsQBy6/Gr1Y1UmhQLRGy+58MqZ1RcIZjDnVn6F2Zw
         aZRGzyUTdI9/5goWbJ1MJd2ThLeGjl8t8GY/fXaK/No8AEF1mFtje6P6Y9H3VDxsWJ46
         1r0IgP79Mcj+8Rqe8Q57jJTWZFd5yknNm0f4KDR7+uQ/sm1RwTlmMhspR6m3uS2QE+tJ
         q6Kg==
X-Forwarded-Encrypted: i=1; AJvYcCX+jRC7cY7AgySGa1Gu3jnkdEoPOK1O/R0dKgRt/S2Uy3Xryf2stSCQt+uePT2Fhx2OZOi3Nfo=@lists.infradead.org
X-Gm-Message-State: AOJu0YzotTlbiXbKD1lyRPVvQYH29g1IWEfqr10MvoMnAeDiIbbcDFhy
	TWbTLupA0LB3spwsMcQg3SiFH0SyJQ1BScF+CylYN06MAWmm1HG6upgu7j/e2qGwz73l9Au7Cse
	tULrJinmvkd7fUBs+XUzi4TYr//3aS2xL1shzbus47VBb+Ua7cvwpTVAJ61I4sGhr
X-Gm-Gg: ASbGncsCX5ahCbdveEiplltTItUv9NJBGbKrFJ1EIrS0KEUF7LQrSx4j2lPHNnsmB+B
	dIMUVguvv5iXDMq2uUAq5rD4gZGuHi7ZuQBsxySgMtVpC1DhP6ogOEx9lJB67BbtOSRqfZ5kGrH
	MmQR+HPxQfkBbxVf54uiOZ9A2jYKUSCxmNu/CPhvoBp0+VTAs39lrMtNNt4E/1Ql/W8aB7KtZ1K
	EawyyIh2f/UWsTEcfk6JoZJSbwgRC9C4O9xQ+hWcYAqJ+cr65nk0Rcejv/aPWi47FjDPjRF0vI+
	DRIsCsuV/PgIM/2LqvqoW3gEhyTgwDWHSYPo5VWIYyElDMre7E2NqcU+HtR15v8=
X-Received: by 2002:a17:902:ce88:b0:235:f45f:ed49 with SMTP id d9443c01a7336-236383677camr24638495ad.33.1749541596497;
        Tue, 10 Jun 2025 00:46:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9ioJqWJjAW3OBxKY8Q3keXw9lPemyCTPatvYkEI9nkTwJZxVY8u4zpkiMNnh4ZOWVzQ758w==
X-Received: by 2002:a17:902:ce88:b0:235:f45f:ed49 with SMTP id d9443c01a7336-236383677camr24638175ad.33.1749541596052;
        Tue, 10 Jun 2025 00:46:36 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603078116sm65678165ad.19.2025.06.10.00.46.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 00:46:35 -0700 (PDT)
Message-ID: <c2d138ba-5b08-4daa-95b3-e1f95f05938d@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 13:16:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Avoid CPU busy-wait by handling VDEV_STAT
 and BCN_STAT
To: bjorn.andersson@oss.qualcomm.com, Jeff Johnson <jjohnson@kernel.org>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Mahendran P <quic_mahep@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250609-ath12k-fw-stats-done-v1-1-2b3624656697@oss.qualcomm.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <20250609-ath12k-fw-stats-done-v1-1-2b3624656697@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Fq9ZmRQI1upRBtzutx6jwpOyuF4Y_UCb
X-Authority-Analysis: v=2.4 cv=GoxC+l1C c=1 sm=1 tr=0 ts=6847e2dd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=6rQvm6eimZqQVVFLZJ0A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: Fq9ZmRQI1upRBtzutx6jwpOyuF4Y_UCb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA1OCBTYWx0ZWRfX1SVXawtbWyqQ
 OHWqQvplKI+pOIW25HzTch/F/kYW30aHejIjWYBpR1heXbAPt8K5QdwbGNUyFFVzwgcacsTVNnO
 dw2O4rmCbQ8CVljyVqRRiGK/gZVZY5bNheNr7x5nEJL0V+xQGTgYUwBe/3Su7+OYOi+C36ykg95
 XO18ZUXZ0b3ifsrrp3GS2SIuAlIAMV7epI+4G/erHOhuTrJIE65b3bwWD1MKr8HtWbDxbRZFhA1
 //3pmn8UKxWKRiZy6OysQwKdk9pGqRF5WwwSNH/7F2IJ5OUzG4JjMVRYGxUlePI8Juc5dU7ur3B
 TZs/bicTDZbf7v8cky8gLQxjc4SGTZYEuBVEMNcqHt+YQCTygM649li7pjP4bmxIqR1PoPY0BtL
 UcFx4O1mEeqij6ID9IkVPLkUItTe4CVEffa2POiqydzQXHwD2fZxI7pJzpHTrOhI5ltKfd7O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_02,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_004640_397608_78A639A0 
X-CRM114-Status: GOOD (  33.60  )
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



On 6/10/2025 8:36 AM, Bjorn Andersson via B4 Relay wrote:
> From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> 
> When the ath12k driver is built without CONFIG_ATH12K_DEBUG, the
> recently refactored stats code can cause any user space application
> (such at NetworkManager) to consume 100% CPU for 3 seconds, every time
> stats are read.
> 
> Commit 'b8a0d83fe4c7 ("wifi: ath12k: move firmware stats out of
> debugfs")' moved ath12k_debugfs_fw_stats_request() out of debugfs, by
> merging the additional logic into ath12k_mac_get_fw_stats().
> 
> Among the added responsibility of ath12k_mac_get_fw_stats() was the
> busy-wait for `fw_stats_done`.
> 
> Signalling of `fw_stats_done` happens when one of the
> WMI_REQUEST_PDEV_STAT, WMI_REQUEST_VDEV_STAT, and WMI_REQUEST_BCN_STAT
> messages are received, but the handling of the latter two commands remained
> in the debugfs code. As `fw_stats_done` isn't signalled, the calling
> processes will spin until the timeout (3 seconds) is reached.
> 
> Moving the handling of these two additional responses out of debugfs
> resolves the issue.
> 
> Fixes: b8a0d83fe4c7 ("wifi: ath12k: move firmware stats out of debugfs")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath12k/debugfs.c | 58 --------------------------
>   drivers/net/wireless/ath/ath12k/debugfs.h |  7 ----
>   drivers/net/wireless/ath/ath12k/wmi.c     | 67 +++++++++++++++++++++++++++----
>   3 files changed, 60 insertions(+), 72 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
> index dd624d73b8b2714e77c9d89b5a52f7b3fcb02951..23da93afaa5c25e806c9859dbbdd796afd23d78a 100644
> --- a/drivers/net/wireless/ath/ath12k/debugfs.c
> +++ b/drivers/net/wireless/ath/ath12k/debugfs.c
> @@ -1251,64 +1251,6 @@ void ath12k_debugfs_soc_destroy(struct ath12k_base *ab)
>   	 */
>   }
>   
> -void
> -ath12k_debugfs_fw_stats_process(struct ath12k *ar,
> -				struct ath12k_fw_stats *stats)
> -{
> -	struct ath12k_base *ab = ar->ab;
> -	struct ath12k_pdev *pdev;
> -	bool is_end;
> -	static unsigned int num_vdev, num_bcn;
> -	size_t total_vdevs_started = 0;
> -	int i;
> -
> -	if (stats->stats_id == WMI_REQUEST_VDEV_STAT) {
> -		if (list_empty(&stats->vdevs)) {
> -			ath12k_warn(ab, "empty vdev stats");
> -			return;
> -		}
> -		/* FW sends all the active VDEV stats irrespective of PDEV,
> -		 * hence limit until the count of all VDEVs started
> -		 */
> -		rcu_read_lock();
> -		for (i = 0; i < ab->num_radios; i++) {
> -			pdev = rcu_dereference(ab->pdevs_active[i]);
> -			if (pdev && pdev->ar)
> -				total_vdevs_started += pdev->ar->num_started_vdevs;
> -		}
> -		rcu_read_unlock();
> -
> -		is_end = ((++num_vdev) == total_vdevs_started);
> -
> -		list_splice_tail_init(&stats->vdevs,
> -				      &ar->fw_stats.vdevs);
> -
> -		if (is_end) {
> -			ar->fw_stats.fw_stats_done = true;
> -			num_vdev = 0;
> -		}
> -		return;
> -	}
> -	if (stats->stats_id == WMI_REQUEST_BCN_STAT) {
> -		if (list_empty(&stats->bcn)) {
> -			ath12k_warn(ab, "empty beacon stats");
> -			return;
> -		}
> -		/* Mark end until we reached the count of all started VDEVs
> -		 * within the PDEV
> -		 */
> -		is_end = ((++num_bcn) == ar->num_started_vdevs);
> -
> -		list_splice_tail_init(&stats->bcn,
> -				      &ar->fw_stats.bcn);
> -
> -		if (is_end) {
> -			ar->fw_stats.fw_stats_done = true;
> -			num_bcn = 0;
> -		}
> -	}
> -}
> -
>   static int ath12k_open_vdev_stats(struct inode *inode, struct file *file)
>   {
>   	struct ath12k *ar = inode->i_private;
> diff --git a/drivers/net/wireless/ath/ath12k/debugfs.h b/drivers/net/wireless/ath/ath12k/debugfs.h
> index ebef7dace3448e4bdf2d6cb155d089267315172c..21641a8a03460c6cc1b34929a353e5605bb834ce 100644
> --- a/drivers/net/wireless/ath/ath12k/debugfs.h
> +++ b/drivers/net/wireless/ath/ath12k/debugfs.h
> @@ -12,8 +12,6 @@ void ath12k_debugfs_soc_create(struct ath12k_base *ab);
>   void ath12k_debugfs_soc_destroy(struct ath12k_base *ab);
>   void ath12k_debugfs_register(struct ath12k *ar);
>   void ath12k_debugfs_unregister(struct ath12k *ar);
> -void ath12k_debugfs_fw_stats_process(struct ath12k *ar,
> -				     struct ath12k_fw_stats *stats);
>   void ath12k_debugfs_op_vif_add(struct ieee80211_hw *hw,
>   			       struct ieee80211_vif *vif);
>   void ath12k_debugfs_pdev_create(struct ath12k_base *ab);
> @@ -126,11 +124,6 @@ static inline void ath12k_debugfs_unregister(struct ath12k *ar)
>   {
>   }
>   
> -static inline void ath12k_debugfs_fw_stats_process(struct ath12k *ar,
> -						   struct ath12k_fw_stats *stats)
> -{
> -}
> -
>   static inline bool ath12k_debugfs_is_extd_rx_stats_enabled(struct ath12k *ar)
>   {
>   	return false;
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
> index 60e2444fe08cefa39ae218d07eb9736d2a0c982b..2d2444417e2b2d9281754d113f2b073034e27739 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.c
> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
> @@ -7626,6 +7626,63 @@ static int ath12k_wmi_pull_fw_stats(struct ath12k_base *ab, struct sk_buff *skb,
>   				   &parse);
>   }
>   
> +static void ath12k_wmi_fw_stats_process(struct ath12k *ar,
> +					struct ath12k_fw_stats *stats)
> +{
> +	struct ath12k_base *ab = ar->ab;
> +	struct ath12k_pdev *pdev;
> +	bool is_end;
> +	static unsigned int num_vdev, num_bcn;
> +	size_t total_vdevs_started = 0;
> +	int i;
> +
> +	if (stats->stats_id == WMI_REQUEST_VDEV_STAT) {
> +		if (list_empty(&stats->vdevs)) {
> +			ath12k_warn(ab, "empty vdev stats");
> +			return;
> +		}
> +		/* FW sends all the active VDEV stats irrespective of PDEV,
> +		 * hence limit until the count of all VDEVs started
> +		 */
> +		rcu_read_lock();
> +		for (i = 0; i < ab->num_radios; i++) {
> +			pdev = rcu_dereference(ab->pdevs_active[i]);
> +			if (pdev && pdev->ar)
> +				total_vdevs_started += pdev->ar->num_started_vdevs;
> +		}
> +		rcu_read_unlock();
> +
> +		is_end = ((++num_vdev) == total_vdevs_started);
> +
> +		list_splice_tail_init(&stats->vdevs,
> +				      &ar->fw_stats.vdevs);
> +
> +		if (is_end) {
> +			ar->fw_stats.fw_stats_done = true;
> +			num_vdev = 0;
> +		}
> +		return;
> +	}
> +	if (stats->stats_id == WMI_REQUEST_BCN_STAT) {
> +		if (list_empty(&stats->bcn)) {
> +			ath12k_warn(ab, "empty beacon stats");
> +			return;
> +		}
> +		/* Mark end until we reached the count of all started VDEVs
> +		 * within the PDEV
> +		 */
> +		is_end = ((++num_bcn) == ar->num_started_vdevs);
> +
> +		list_splice_tail_init(&stats->bcn,
> +				      &ar->fw_stats.bcn);
> +
> +		if (is_end) {
> +			ar->fw_stats.fw_stats_done = true;
> +			num_bcn = 0;
> +		}
> +	}
> +}
> +
>   static void ath12k_update_stats_event(struct ath12k_base *ab, struct sk_buff *skb)
>   {
>   	struct ath12k_fw_stats stats = {};
> @@ -7655,19 +7712,15 @@ static void ath12k_update_stats_event(struct ath12k_base *ab, struct sk_buff *sk
>   
>   	spin_lock_bh(&ar->data_lock);
>   
> -	/* WMI_REQUEST_PDEV_STAT can be requested via .get_txpower mac ops or via
> -	 * debugfs fw stats. Therefore, processing it separately.
> -	 */
> +	/* Handle WMI_REQUEST_PDEV_STAT status update */
>   	if (stats.stats_id == WMI_REQUEST_PDEV_STAT) {
>   		list_splice_tail_init(&stats.pdevs, &ar->fw_stats.pdevs);
>   		ar->fw_stats.fw_stats_done = true;
>   		goto complete;
>   	}
>   
> -	/* WMI_REQUEST_VDEV_STAT and WMI_REQUEST_BCN_STAT are currently requested only
> -	 * via debugfs fw stats. Hence, processing these in debugfs context.
> -	 */
> -	ath12k_debugfs_fw_stats_process(ar, &stats);
> +	/* Handle WMI_REQUEST_VDEV_STAT and WMI_REQUEST_BCN_STAT updates. */
> +	ath12k_wmi_fw_stats_process(ar, &stats);
>   
>   complete:
>   	complete(&ar->fw_stats_complete);
> 


This look fine to me, Thanks for fixing this.

Apart from this we may also have to free up the stats buffer list 
maintained when the stats is requested out of debugfs (like 
ath12k_mac_op_get_txpower() and ath12k_mac_op_sta_statistics()) once its 
scope of usage is done, else the memory will be held untill next fw 
stats request or module unload.

-- 
--
Ramesh


