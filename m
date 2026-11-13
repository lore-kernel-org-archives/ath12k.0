Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B12B606A32D
	for <ath12k@archiver.kernel.org>; Fri, 13 Nov 2026 07:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ohP+s+ft;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IKrqBXbW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RqI1aWoY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NUl3m6J5h7TCNp52N0g9QRpKf+c3/loK8kBHxy8vOxQ=; b=ohP+s+ftxS+n0nMlk2gBd6fMrG
	mL4ZeCmptsL4wRU5oOGpydVPbonCe1Mmgnbjr5Ey5o31SrvLB0ZQj3H78vpGGY+I/UVglaOXvDXxv
	2GwuWIqBA451PR8QZM8ms/WQSh5xNTYF4WZbWKzJsIuY2ewdXFJmwZBo68RTOi2cMIkgEhhiwWlum
	cgMrjznoX70GiHC8Sf/wAQVcAMbEV27+GgK5zLFEqeOnPY6kgGddgslUb2qeG1he2Mn9tjKvdWXUz
	adn/amYbcg+VL6tvKMr0/7m0s04cgr8cv/rAAA6Zy7wsSxXltPbsKdSGfQSPjWvxbSYNZGdeAxbLN
	S7gUzGZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRlve-0000000BvsW-31mu;
	Fri, 13 Nov 2026 07:42:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRlvb-0000000Bvs3-3JJR
	for ath12k@lists.infradead.org;
	Fri, 13 Nov 2026 07:42:33 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD57Imj1973642
	for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 07:42:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NUl3m6J5h7TCNp52N0g9QRpK
	f+c3/loK8kBHxy8vOxQ=; b=IKrqBXbW+S1yf2L+Lm3ZghG01nzAfsaaUMKMZR6d
	2Y9uuJZNT2swj+FR1QJJ8zT9MJQ+nroqqhjwN9IFSABNwUpnm0iABq1jVx4Kur+E
	vp2mIERuTNtqhXtGjuJKef+NrF5rUMZAuiDP5DmubXsdORit1TNHbQbV+4I5FCz3
	aK8Y4QHyT6pQ4xwh9WOqetFA7KvBlxPB7occy19Cka00JJKnZduvMK9/q2+ELYiX
	SMglpDVmAJjthY1D5bTZmocJ4zM8S8+9icDBuWVdblifaoOpixwVxAu8iYVLE3i2
	0yHmgraIYz4RJ2h2pqiEw/U5T+vF2uq7cW9jT34dYYMLmg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwg1bb2d5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 07:42:30 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b25d977b91so529748c88.1
        for <ath12k@lists.infradead.org>; Thu, 12 Nov 2026 23:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794555750; x=1795160550; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NUl3m6J5h7TCNp52N0g9QRpKf+c3/loK8kBHxy8vOxQ=;
        b=RqI1aWoYbJnd90LPHw26CTiA37X8KE+9/por0QNj9UJDggZ9lDF4vUZbC7nyyKuW7j
         kI+mVUxJjSGT/byD5auVqOQKGCx/xkzgpk+Amu9bg3KkGC4XrcCzoxpnAVtgw/L3xKVH
         XHdbXbbOmDDJ9aafu8GG1yAjZuRE77iIES1mjreF3gj7XQwX1HrpFQf/H/3WRNrlTRhb
         yo2N8W5PL+54EG2HZTi1T8lVE7MyZ5QEvvXrV3fOMrM1pwfzC+99LZpq49njzLv2itMF
         6aqd2zr7ItKzB+GNBUdyj4SFETlrHi4oZRNB4iMi51PxTotKhKWkf572Lvz5sOLg7iMV
         06tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794555750; x=1795160550;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NUl3m6J5h7TCNp52N0g9QRpKf+c3/loK8kBHxy8vOxQ=;
        b=wyqDLWxU4MxJBNQbNQOuFJ8VdYM4ehLIefDTHfkh4lybIOmckgh7O7LADWE1JJEASR
         GmyXyIppTFlYnljrEzXsKoYGG/Pi6yOSkS/AgiUmxvJ//LGb2fiRNYX5CflNtUuDz9lw
         ADO06fWsGfABMtQPpsRn31k+CxmXo78HdPK6tXFkHUX8b4+DfjEzVTky2Kow5gRKkXtk
         l8fcj0bdNkD2i5OPAh228F6fu6iHEido43YFAi7Zc0RQHMEERJIlr/11d5Dg27nQmCSC
         Eo/ir7/arPGhQ6G6ympNJXL7QBBvC7rOtHetedoIENR0h5hA+Xf9YYQ8XJmqlsGBmOne
         tiIw==
X-Forwarded-Encrypted: i=1; AL+hErGg0dFH1k68Mk88tOPd8qrn6Z89+Ru5lbmelv44Fx7y53is71BeediyzJBJ8Sj4UhxpUWERnVA=@lists.infradead.org
X-Gm-Message-State: APuU4Z+Tj+H1sJVKCEHvRL+y0zb2+aCSCZtr26nYq+FKX4Ncs3wPemkV
	cr3O/EuU/GtlbDDC/cvmWsC0P5Hu+0eKQTEMW3bv4Rvm43ccytxXjLeH2L9QYKHGdaDZa816j8X
	S5+LZ8BAUuTIhMLA3Li8llKvCENhloA9pp/hEPcJHaiu7qV80/kmP+93jPEP/2MMc
X-Gm-Gg: AYBFou21Lo7jH1nc1JVcHQp6jdJkL9YlGxe5vwxJX+d7X+qIuTpIEiE+kvmZB1rnPhE
	vQ61CoDAdigSut9ng6Fw7J6s6LbYnymyv1JSr3D0OGWJ8CYdLTORkeX6wox+uucERx0Sar/l4oy
	PfUHE1agDT5Xs/S7UGkhmHX7h39JLqDnavYYEng9PgUqtjA12er840wPTCBVgLOsISrVlclIbQU
	MbXMEEsKay80hrRWuUAV4fhpGU55ET/HZBADbOPi5qNBFx3zV/ab562l8nGbhpCERA2w7KdDXzB
	CdezTSsViy6RLlbpdrNB1Z4u/S9S4QXlUc7pJzzKlS1IGEy4m5UpT1AW/4Qy6zoJhSkbxIExwC0
	uZq/1aLooeM89bDYbXztHjrd+Th+tWWYBDaEBqlaT0guZ9YEzyJxbC6JK6khWSYCDMPGbyM5lFO
	5G
X-Received: by 2002:a05:701b:290a:b0:16c:3408:760b with SMTP id a92af1059eb24-1b503121292mr1619113c88.32.1794555749321;
        Thu, 12 Nov 2026 23:42:29 -0800 (PST)
X-Received: by 2002:a05:701b:290a:b0:16c:3408:760b with SMTP id a92af1059eb24-1b503121292mr1619067c88.32.1794555748517;
        Thu, 12 Nov 2026 23:42:28 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50309b2b5sm4436549c88.1.2026.11.12.23.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:42:28 -0800 (PST)
Date: Fri, 13 Nov 2026 13:12:16 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
Cc: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 3/8] media: iris: migrate firmware loading to
 qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Message-ID: <20261113074216.5md7myragcw2xkf2@hu-mojha-hyd.qualcomm.com>
References: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
 <20260925155737.4161358-4-mukesh.ojha@oss.qualcomm.com>
 <aa70a256-eba2-483f-8326-c3bd2ff3d33e@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa70a256-eba2-483f-8326-c3bd2ff3d33e@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=c6Q+0h9l c=1 sm=1 tr=0 ts=6af6bf66 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=sX6kAIEwX3NwIotb1QIA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: ccYs2RnM_sdCyQliaaDy1M6veRa0uVlt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzMCBTYWx0ZWRfX5feI7VS9HV18
 N9QT2nyf0tyrqoEbBib+5TwVIHvwXhaN5k4RjQM5kbtuJnrL7Walkgk1na8xlJWXSvsLMbxmfOV
 Nco1sXp8X6jt0kgMPv9RfVbfsvS8YB3taCt9xMpi9+ldk8L4L5Ma7V/eHdl+1wo9AS6sotzbxEH
 UpnH3CP+eEc6/vJH8bgy3xCTpONg/PJ7ZZYawUJ39pZBiLCbSW8H9etLZEFj2JXPbNrSe/F2DNg
 +vFuIhZ2uHfNwtURZs2gBWfB0mPtCZNnGnwTTxyNXHW1Sqvy91sOQM5IGwRWfiIyYIakcTz4wb+
 b2ZoTIars8kEnGZoP+3B64XpD5mQrGfXyNajIlS+I/+XMFVcOo6HFPrAX7GSPuL3jdniQ+ntc+a
 2yiWgtreV/UitMmAzbuvd7K1RVAreMCyhlLW922bGQ/uZTQeJw7KfAGjMjOoIfV0hD+/GfQR50T
 kv4bZ8JgJXBcRcSanVg==
X-Proofpoint-ORIG-GUID: ccYs2RnM_sdCyQliaaDy1M6veRa0uVlt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzMCBTYWx0ZWRfX12F6JcINYfr/
 FaVl7UwQtUaKr0eciTNFHfqcRBoGGo9+jroMli+8XXMBJTEA5ENnmqWXpFpN42BwhEsUzpgfDF2
 Jg+MpitymYDjbpOeCSt98ZtVjx31RV8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_234231_858939_6B7593C9 
X-CRM114-Status: GOOD (  32.44  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 03:01:41PM +0530, Gourav Kumar wrote:
> 
> 
> On 9/25/2026 9:27 PM, Mukesh Ojha wrote:
> > iris_load_fw_to_memory() calls qcom_mdt_load() which bundles metadata
> > init, memory setup, and segment loading with no PAS context, and
> > iris_fw_load() calls qcom_pas_auth_and_reset() which skips the shmbridge
> > prepare step required before TrustZone authentication.
> > 
> > Since the auth call is in a different function from where the PAS context
> > is allocated, add a pas_ctx pointer to struct iris_core so it can be
> > threaded between the two call sites.  Replace qcom_mdt_load() with
> > devm_qcom_pas_context_alloc() and qcom_mdt_pas_load() in
> > iris_load_fw_to_memory(), storing the context in core->pas_ctx, then
> > pass it to qcom_pas_prepare_and_auth_reset() in iris_fw_load().
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  drivers/media/platform/qcom/iris/iris_core.h  |  2 ++
> >  .../media/platform/qcom/iris/iris_firmware.c  | 20 ++++++++-----------
> >  2 files changed, 10 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> > index 24da60448cf2..68e6adcc1dfd 100644
> > --- a/drivers/media/platform/qcom/iris/iris_core.h
> > +++ b/drivers/media/platform/qcom/iris/iris_core.h
> > @@ -8,6 +8,7 @@
> >  
> >  #include <linux/types.h>
> >  #include <linux/pm_domain.h>
> > +#include <linux/firmware/qcom/qcom_pas.h>
> >  #include <media/v4l2-device.h>
> >  
> >  #include "iris_hfi_common.h"
> > @@ -123,6 +124,7 @@ struct iris_core {
> >  	/* encoder and decoder have overlapping caps, so two different arrays are required */
> >  	struct platform_inst_fw_cap		inst_fw_caps_dec[INST_FW_CAP_MAX];
> >  	struct platform_inst_fw_cap		inst_fw_caps_enc[INST_FW_CAP_MAX];
> > +	struct qcom_pas_context			*pas_ctx;
> >  };
> >  
> >  int iris_core_init(struct iris_core *core);
> > diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> > index 21cdf1c39835..e73a5dd98b88 100644
> > --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> > +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> > @@ -115,9 +115,7 @@ static int iris_load_fw_to_memory(struct iris_core *core)
> >  	struct resource res;
> >  	phys_addr_t mem_phys;
> >  	const char *fw_name;
> > -	size_t res_size;
> >  	ssize_t fw_size;
> > -	void *mem_virt;
> >  	int ret;
> >  
> >  	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
> > @@ -125,7 +123,6 @@ static int iris_load_fw_to_memory(struct iris_core *core)
> >  		return ret;
> >  
> >  	mem_phys = res.start;
> > -	res_size = resource_size(&res);
> >  
> >  	firmware = iris_detect_firmware(core, &fw_name);
> >  	if (IS_ERR(firmware))
> > @@ -134,21 +131,20 @@ static int iris_load_fw_to_memory(struct iris_core *core)
> >  	core->iris_firmware_data = core->iris_firmware_desc->firmware_data;
> >  
> >  	fw_size = qcom_mdt_get_size(firmware);
> > -	if (fw_size < 0 || res_size < (size_t)fw_size) {
> > +	if (fw_size < 0 || resource_size(&res) < (size_t)fw_size) {
> >  		ret = -EINVAL;
> >  		goto err_release_fw;
> >  	}
> >  
> > -	mem_virt = memremap(mem_phys, res_size, MEMREMAP_WC);
> > -	if (!mem_virt) {
> > -		ret = -ENOMEM;
> > +	core->pas_ctx = devm_qcom_pas_context_alloc(dev, IRIS_PAS_ID, mem_phys,
> > +						    resource_size(&res));
> > +	if (IS_ERR(core->pas_ctx)) {
> > +		ret = PTR_ERR(core->pas_ctx);
> > +		core->pas_ctx = NULL;
> >  		goto err_release_fw;
> >  	}
> >  
> > -	ret = qcom_mdt_load(dev, firmware, fw_name,
> > -			    IRIS_PAS_ID, mem_virt, mem_phys, res_size, NULL);
> > -
> > -	memunmap(mem_virt);
> > +	ret = qcom_mdt_pas_load(core->pas_ctx, firmware, fw_name, NULL);
> 
> qcom_mdt_pas_load() passes the ctx to qcom_pas_init_image(), which keeps
> the metadata buffer in ctx->ptr, and qcom_pas_prepare_and_auth_reset()
> does not free it. Who is expected to call qcom_pas_metadata_release()
> for iris? I don't see it called after authentication (or on its
> failure), unlike in qcom_q6v5_pas.c.
> 
Below change is merged, so buffer will be freed in the call itself, no need
to call qcom_pas_metadata_release() explicitly for clients who are not
interested in saving their metadata context.


https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=2aa8fafc08e777e9da356307c1a0117e7f4277cf


> Gourav Kumar
> 
> >  err_release_fw:
> >  	release_firmware(firmware);
> >  
> > @@ -166,7 +162,7 @@ int iris_fw_load(struct iris_core *core)
> >  		return ret;
> >  	}
> >  
> > -	ret = qcom_pas_auth_and_reset(IRIS_PAS_ID);
> > +	ret = qcom_pas_prepare_and_auth_reset(core->pas_ctx);
> 
> ctx->use_tzmem is not set for iris, so the shmbridge creation in
> qcom_scm_pas_prepare_and_auth_reset() is skipped and the behaviour is
> the same as the old qcom_pas_auth_and_reset(). Please reword the commit
> message accordingly, since it currently implies that the prepare step is
> now performed by the new API as a fix.

Sure.

> 
> Gourav Kumar
> 
> >  	if (ret)  {
> >  		dev_err(core->dev, "auth and reset failed: %d\n", ret);
> >  		return ret;
> 

-- 
-Mukesh Ojha

