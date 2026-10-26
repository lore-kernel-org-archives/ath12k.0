Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0A1606A321
	for <ath12k@archiver.kernel.org>; Mon, 26 Oct 2026 11:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TbsENJUf;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dnEBl84P;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ILurDOWL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kpZyhfaDwEx58Hf8F98PivHYwKz/1TShh9vNrajkRso=; b=TbsENJUfdt1WCd
	vc/1+VFCotQJwEq+NxSiu1zEmHCHDGsDGBVRJbaz4Xntngbz2oWLOQ6ysHv6Juen13V5X42E1S+Ni
	LG1/6WMv46jAJzxZ1VBMHjqjZyNG0R9gqJEd+yFbNm6leke+cRockJgjy7l1jcNle1A35hmpY2jeQ
	SaQQo6+JEy159obeHPzy7CHhQFQ/UxuTFtIC2Nehjc7pVCTGhMzXHz8hDHhqumHUsTUGwlKuVeIU6
	ApoF7aYrwgP4R1XnQk6AMuhGNq8X9ExqhV71sNe8aFfk5r9P58uQ3LAjVcRtN81TrkrRQ4eXf51MA
	md7Zp0gm8qmlcQTPYYlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLIpq-00000002MwK-0nAR;
	Mon, 26 Oct 2026 11:25:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLIpo-00000002MvP-0m1W
	for ath12k@lists.infradead.org;
	Mon, 26 Oct 2026 11:25:49 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAsuGX3561847
	for <ath12k@lists.infradead.org>; Mon, 26 Oct 2026 11:25:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kpZyhfaDwEx58Hf8F98PivHYwKz/1TShh9vNrajkRso=; b=dnEBl84PS75rsH+m
	t8WJ81u2wB65Nq2f6dOZLiSzrRzUKj9Pyzz3f2MND7GXZofF94QSfPq6MViMHQBq
	bSksoKo1Y38NbJHZz1v6vnCKdVCH70IYmaV0Umc8+BS+KcjIdEcJfBQ+4MEMozog
	o+2Ym5XwBrdsZDjk/RqWosjsWX5+LEAvltQ8WhhU5dARfQE23oIebl5uYuWOWQTA
	em6gk0bD2HUH9s1AEODOEAXwpQeH600P0hHKdXLJEuXnKFdhGr3hHruBA9KPExlr
	TdUGU4BwIYnoJZYFsYqTPOXVafySOKY3NF+LOeofxcYziPiLyE4e4WNY0W/SMTdy
	RXQfVg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4s90arg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 26 Oct 2026 11:25:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ca9b53afaso454482185a.0
        for <ath12k@lists.infradead.org>; Mon, 26 Oct 2026 04:25:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793013946; cv=none;
        d=google.com; s=arc-20260327;
        b=axPs7eHYr4ZhLNz8osxXMuzUtCoupONYwNg+YG+H7L5HYpKkJnFMvsiL/zk7vGJvWt
         90GLTevH/z8uoQ+wrtmFpR/J/x0bopBert7TyLRYUodC29sZPuv3uDRjKksDymP2mZkx
         xIdhLZMFmKICP5QoxyE030/obYS8AEkhO5JISbTjlCFDDcVukvyY4vpkte+wXFgh11uj
         Lmo332NcgETpumpHBUyBjnG2UQC+iccA/ena4CnjFS1ok3OOvYue4hTQV6HFVyWlUxve
         BYTBSBn6rR9tf1kQ01KJrv72nGK+b0pn2erBcK0c33wc8ZwJmjwjh/UPZDejzTf1g8jH
         +Oiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kpZyhfaDwEx58Hf8F98PivHYwKz/1TShh9vNrajkRso=;
        fh=eYshhlD5apHJyfbOlya+Pl18Qf9QZi9opPZq0rvRJZU=;
        b=lk+JHK9L7tm7WWZ2KVIDrF7mPU03IGCJtkQcubRBs+RRhnb87gBo8CawSsyDTSBp/Q
         dbNIvcypO7l3XOfGgITjFOIhpanqJDzmLlmUzGz/STEsSrSTr3oc4KHqyLTFYM8D52Lc
         YOr8o3HJTG1617k8knJ2wQctP4eeS+Ersrrr/YTcc0FcC98zOXKTm5P2NnXuomCcDELJ
         JF8AHpzfbmpp8ll1lOB6OEFE01Z2YPo2chVgT0ML5mMe9pI4MtmJK5Ku0jNxKxdtX8Ty
         baLQIh3IxNBSpYX4wUZjxKfm6GNOLSWcona8QY+379JSvabc3FuDu+ccoPrOAW12q1VH
         1H0Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013946; x=1793618746; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kpZyhfaDwEx58Hf8F98PivHYwKz/1TShh9vNrajkRso=;
        b=ILurDOWLU8CZEn4jbOm1/UOR5fq5NCfj23Mw7Gjqj4tnSo05buTyWXImB+mMp/+eKJ
         nDSbZnYPkLq9ScmYL+M3FWODSNdUuI1J1hdksF70mS31f6FdghS63UHT2y5JVcIQmvKf
         onou9kcq2qtvPh4LH+UiQVWvgAEzYl9ayJA8AbxpsV3Te3QGPzTdbNuS776QC5Z/H28/
         Xme7dt2gyOvIsRMByl5SF5UL2D663rTV8+V/Uw4Z5aQChE/d90zMupFcCyprpFMeFIHS
         VP/bWpldky1AOxdSMbz/bZrmkuN1b1pzBshYbAGcFqiBOqwF5acyE7SsiQEgB2f41j3e
         WRsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013946; x=1793618746;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kpZyhfaDwEx58Hf8F98PivHYwKz/1TShh9vNrajkRso=;
        b=UrGa9LESmuZN+2K6xDJSLJeSDFcbT5bq8YkMRKuEdO+i68NrP0oyNQwPcyJIYauOJJ
         pJAoBkHhLEdozPp8Asw/o9hreTU1r0PW5IEs1D1RupMURP+5NSWPt9aBNGHG3DGhXyZS
         kO/Gm3pV5oNufphASfu3Dc76zYxDMX7iJwv9NEW3kBuYOaj4BlS35JT7jdfkul/9IZAj
         kSEdHTMkvfPI+HgDxw/QuXIIY3eR/K1FT5ePgieITyhY7rdf9oflOKX0U2JwlpoRGQl8
         EN3KHlDAH19RTd25i6+O6a+8xigQqBJ6OWwQ8ViU8DwaltUAc5fdCBnCk+hglonxwV9y
         4D1A==
X-Forwarded-Encrypted: i=1; AKwUvByrsL/JwQ1SBwhQiOMTxX2jnFqWJRsJk59urjrZSSy1Tq7wVTqdmthPndQ8RuDyo2QCDokupb8=@lists.infradead.org
X-Gm-Message-State: AFq9FYKeLXlSr5iRCqcbJ0cufNSkBxfYoc0iHasfDc3081IbNoRKmT98
	FsNis72QsTSITjVfCz6uY6V2EMCkZJFPddNAD2+pQT4w8mrOHLz4LsdF6YZbDE9wwTYraeY8HzO
	rzdWU8Bqy389vt9IKGpUbyhlzsyZASrytSHhWmn1ZpNMwoi+tP1GOi8a4NdMNZRJ0QlHFv54B2P
	YOEzMcg1Hmf99GUb9T1IL+y/cOYm79F7DFKuVuFKo=
X-Gm-Gg: AYBFou39NlM/hqgJ/T8HvCzlvkIHKDqoX+6ShoDKZcyQajD6+rbWTH7xPwx4IM2pqOM
	eOrK4bSfzqQ63wQla0A8BOt+CyNB9hSKfAlZJskJoG8EnKj3AQcIp9gtdIneI+U9xidoicbzn+i
	1bF4L/5hiafYq8Vq7SVDORDLpBfJ8oFn9phzUV5jFde4NbFsI0Ykac/NO+hHfPIudzqvVc3pgHJ
	EhzG/rjEPQhopEWo/RaqK8rh/BydDgtyezFKq+JQ+yaDrHnntiqkFYqwu71eqBVojfSHYdWAVtf
X-Received: by 2002:a05:620a:178b:b0:93f:26d6:d70b with SMTP id af79cd13be357-940ef8af1a0mr924706085a.29.1793013946391;
        Mon, 26 Oct 2026 04:25:46 -0700 (PDT)
X-Received: by 2002:a05:620a:178b:b0:93f:26d6:d70b with SMTP id
 af79cd13be357-940ef8af1a0mr924701085a.29.1793013945915; Mon, 26 Oct 2026
 04:25:45 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com> <20261014-b4-nvmem-efivar-v1-3-187c85f65018@oss.qualcomm.com>
In-Reply-To: <20261014-b4-nvmem-efivar-v1-3-187c85f65018@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 12:25:34 +0100
X-Gm-Features: AclHuK_V9TSwenazx_QbQTVJlNkn-z_z7PltZHh3vUhKfg_kBmr_W8aabFtQzwU
Message-ID: <CAFEp6-2akDevVekLozzaH1e7rNuqqfpHjQiQvSkwuv_4zLucjw@mail.gmail.com>
Subject: Re: [PATCH RFC 3/5] Bluetooth: hci_qca: Support BD address from an
 nvmem cell
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX1QEGpqR6UAmv
 b2xAgMccrpD45uuCWmsxfgJzLwAoByTu2c92SO7bJZgHe2W/eCjkABLBr+CrXeLBzay8torxXrJ
 KihvQSwUB4HWGGEesS/eWTpIHxjrvMFU4d3kha58mckx9/a/P/KMXVyxpDdECYRwoqLYuVyys25
 bYZ4t1DCiAMwxwbzKCD0BnOLHnAs7Qqi3arS06cTuekFhrG913jlk4Bf0sTHQwdGpL6mD/+YMaJ
 Wuh7/CWkmlxEdwC16VOL57MbV+3PgRck3Wunh56EnIdYVi2IS80eX3qnd4KapmbKfUb/Sevr4aM
 6j1K71KI/Ucz0BAK9GIe5O1531f4btOXv60QHrmLoS1fS4Q2oeDUt9wjoyqAvGY2vWuFK3miGEp
 6GyvfrrJt6ze7B5aW+4mqYEn5cAvGTtKV1SXQOgOoFXBKmHCvapGI21z5Df3VqKka5NMuenDJlt
 y3eaIG29QNdNCBmYC2g==
X-Proofpoint-ORIG-GUID: 63SMyZnnffVzgXXwbrzHxg390Z6Fzkdf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX9uSZL8zg2qZq
 l6MEvl7ez0pEd4ioDAQa7f1kJLA1izgy47AOMjVzszX7OEprkKQdQRfyCpAFBkDIjQvTZaK5zET
 ZAfq8IMzxYRDS9eMz1o8FSEAQJLZHtU=
X-Proofpoint-GUID: 63SMyZnnffVzgXXwbrzHxg390Z6Fzkdf
X-Authority-Analysis: v=2.4 cv=HKhWhYtv c=1 sm=1 tr=0 ts=6adf38bb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=v5oHNKCaMdnEZ5eDWvYA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_042548_346593_92CA88E7 
X-CRM114-Status: GOOD (  25.10  )
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
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Abel,

On Wed, Oct 14, 2026 at 3:05=E2=80=AFPM Abel Vesa <abel.vesa@oss.qualcomm.c=
om> wrote:
>
> Read an optional Bluetooth device address from an nvmem cell named
> "bd-address" (as already supported by hci_ll), and program it into the
> controller during setup. This lets QCA controllers source their BD_ADDR
> from firmware-provisioned storage such as a UEFI variable exposed via
> nvmem. An all-zero value is ignored, so unprovisioned storage leaves
> the controller default address untouched.

I proposed a similar solution here, at bluetooth core level:
https://lore.kernel.org/all/20261015-block-as-nvmem-v11-5-f890ac74f87d@oss.=
qualcomm.com/

Regards,
Loic


>
> Assisted-by: LLM
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/bluetooth/hci_qca.c | 48 +++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 48 insertions(+)
>
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 7089e9b639b2..b704f4c3e1a4 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -25,6 +25,7 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/nvmem-consumer.h>
>  #include <linux/acpi.h>
>  #include <linux/platform_device.h>
>  #include <linux/pwrseq/consumer.h>
> @@ -230,6 +231,8 @@ struct qca_serdev {
>         bool bdaddr_property_broken;
>         bool support_hfp_hw_offload;
>         const char *firmware_name[2];
> +       bdaddr_t bdaddr;
> +       bool bdaddr_valid;
>  };
>
>  static int qca_regulator_enable(struct qca_serdev *qcadev);
> @@ -2079,6 +2082,16 @@ static int qca_setup(struct hci_uart *hu)
>         else
>                 hu->hdev->set_bdaddr =3D qca_set_bdaddr;
>
> +       /* Program a BD address sourced from an nvmem cell, if provided. =
*/
> +       if (qcadev && qcadev->bdaddr_valid) {
> +               int berr =3D hu->hdev->set_bdaddr(hdev, &qcadev->bdaddr);
> +
> +               if (berr)
> +                       bt_dev_warn(hdev, "Failed to set nvmem bd-address=
: %d", berr);
> +               else
> +                       bt_dev_info(hdev, "Set bd-address %pMR from nvmem=
", &qcadev->bdaddr);
> +       }
> +
>         if (qcadev && qcadev->support_hfp_hw_offload)
>                 qca_configure_hfp_offload(hdev);
>
> @@ -2420,6 +2433,41 @@ static int qca_serdev_probe(struct serdev_device *=
serdev)
>         qcadev->bdaddr_property_broken =3D device_property_read_bool(&ser=
dev->dev,
>                         "qcom,local-bd-address-broken");
>
> +       /* Optional BD address from an nvmem cell (e.g. a UEFI variable).=
 */
> +       {
> +               struct nvmem_cell *cell;
> +
> +               cell =3D nvmem_cell_get(&serdev->dev, "bd-address");
> +               if (IS_ERR(cell)) {
> +                       err =3D PTR_ERR(cell);
> +                       if (err =3D=3D -EPROBE_DEFER)
> +                               return err;
> +                       /* -ENOENT/-ENOSYS: no cell configured, ignore. *=
/
> +               } else {
> +                       size_t clen;
> +                       void *cdata =3D nvmem_cell_read(cell, &clen);
> +
> +                       nvmem_cell_put(cell);
> +                       if (!IS_ERR(cdata)) {
> +                               /*
> +                                * Ignore an all-zero address: the backin=
g
> +                                * storage has not been provisioned.
> +                                */
> +                               if (clen =3D=3D sizeof(bdaddr_t) &&
> +                                   bacmp(cdata, BDADDR_ANY)) {
> +                                       /*
> +                                        * Per the device tree bindings t=
he nvmem
> +                                        * value is MSB first, while bdad=
dr_t is
> +                                        * LSB first.
> +                                        */
> +                                       baswap(&qcadev->bdaddr, cdata);
> +                                       qcadev->bdaddr_valid =3D true;
> +                               }
> +                               kfree(cdata);
> +                       }
> +               }
> +       }
> +
>         if (data)
>                 qcadev->btsoc_type =3D data->soc_type;
>         else
>
> --
> 2.54.0
>
>

